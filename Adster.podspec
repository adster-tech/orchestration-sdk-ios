Pod::Spec.new do |s|
s.name              = 'Adster'
s.version           = '1.8.0'
s.summary           = 'Adster Sdk provides you complete ads support for your iOS application'
s.homepage          = 'https://adster.tech/'
s.license      = "MIT"
s.authors      = { "Adster" => "" }
s.platform     = :ios, "15.0"
s.swift_version = "5.0"

s.source            = {
:git => 'https://github.com/adster-tech/orchestration-sdk-ios.git',
:tag => "#{s.version}" }

  s.vendored_frameworks = [
    'Frameworks/AdsFramework.xcframework',
  ]
s.static_framework = true
s.resource_bundles = { 'AdsterResources' => ['Sources/Adster/Resources/*.xib'] }
s.resources = 'Sources/Adster/Resources/*.bundle'
s.frameworks = 'AdSupport', 'AppTrackingTransparency', 'WebKit'

# AdsFramework.xcframework is built against the Google Mobile Ads SDK
# (13.2.0), but does not contain Google implementation objects.
# The host links this dependency once; the range includes 13.11.0.
s.dependency 'Google-Mobile-Ads-SDK', '~> 13.2'
end
