Pod::Spec.new do |s|
s.name              = 'Adster'
s.version           = '1.2.6'
s.summary           = 'Adster Sdk provides you complete ads support for your iOS application'
s.homepage          = 'https://adster.tech/'
s.license      = "MIT"
s.authors      = { "Adster" => "" }
s.platform     = :ios, "14.0"
s.swift_version = "5.0"

s.source            = {
:git => 'https://github.com/adster-tech/orchestration-sdk-ios.git',
:tag => "#{s.version}" }

  s.vendored_frameworks = [
    'Frameworks/AdsFramework.xcframework',
    'Frameworks/DTBiOSSDK.xcframework',
    'Frameworks/FBAudienceNetwork.xcframework'
  ]
s.frameworks = 'AdSupport', 'AppTrackingTransparency', 'WebKit'
end
