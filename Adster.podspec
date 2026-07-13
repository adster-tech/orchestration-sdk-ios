Pod::Spec.new do |s|
s.name              = 'Adster'
s.version           = '1.6.8'
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
s.frameworks = 'AdSupport', 'AppTrackingTransparency', 'WebKit'

# AdsFramework.xcframework is built against the Google Mobile Ads SDK
# (13.2.0). It must be declared so consumers get the GoogleMobileAds module
# transitively.
s.dependency 'Google-Mobile-Ads-SDK', '~> 13.2'
end
