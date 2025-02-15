Pod::Spec.new do |s|
s.name              = 'Adster'
s.version           = '1.0.1'
s.summary           = 'Adster Sdk provides you complete ads support for your iOS application'
s.homepage          = 'https://adster.tech/'
s.license      = "MIT"
s.authors      = { "Adster" => "" }
s.platform     = :ios, "14.0"
s.swift_version = "5.0"

s.source            = {
:git => 'git@github.com:adster-tech/orchestration-sdk-ios.git',
:tag => "#{s.version}" }

  s.vendored_frameworks = [
    'Frameworks/AdsFramework.xcframework'
  ]

  s.pod_target_xcconfig = {
    "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64"
  }
  s.user_target_xcconfig = {
    "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64"
  }
end
