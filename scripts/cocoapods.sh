#!/bin/bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_dir"

mode="${1:-lint}"
if [[ $# -gt 1 || ( "$mode" != lint && "$mode" != publish ) ]]; then
    echo "Usage: $0 [lint|publish]" >&2
    exit 2
fi

# Unlike a podspec's pod_target_xcconfig, this also reaches transitive pod targets.
export XCODE_XCCONFIG_FILE="$repo_dir/config/CocoaPods.xcconfig"

if [[ "$mode" == lint ]]; then
    exec pod lib lint Adster.podspec --allow-warnings
fi

version="$(ruby -rcocoapods -e 'puts Pod::Specification.from_file("Adster.podspec").version')"
if ! git diff --quiet HEAD -- Adster.podspec Frameworks; then
    echo "Commit Adster.podspec and Frameworks before publishing $version." >&2
    exit 1
fi

if git rev-parse --verify --quiet "refs/tags/$version" >/dev/null; then
    if ! git diff --quiet "$version" HEAD -- Adster.podspec Frameworks; then
        echo "Tag $version does not contain the current podspec/frameworks. Resolve the release tag before publishing; this script never overwrites tags." >&2
        exit 1
    fi
fi

# Fail on a local build error before creating or pushing a release tag.
pod lib lint Adster.podspec --allow-warnings

if ! git rev-parse --verify --quiet "refs/tags/$version" >/dev/null; then
    git tag "$version"
fi

# CocoaPods validates s.source by cloning this tag from GitHub.
# A normal push also rejects an existing remote tag with different contents.
git push origin "refs/tags/$version:refs/tags/$version"
exec pod trunk push Adster.podspec --allow-warnings
