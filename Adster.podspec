Pod::Spec.new do |s|
s.name              = 'Adster'
s.version           = '1.5.8'
s.summary           = 'Adster Sdk provides you complete ads support for your iOS application'
s.homepage          = 'https://adster.tech/'
s.license      = "MIT"
s.authors      = { "Adster" => "" }
s.platform     = :ios, "13.0"
s.swift_version = "5.0"

s.source            = {
:git => 'https://github.com/adster-tech/orchestration-sdk-ios.git',
:tag => "#{s.version}" }

  # RazorpayAdsSdk is vendored here for CocoaPods; SPM consumers get it
  # remotely from github.com/razorpayads/ios-sdk instead (see Package.swift).
  s.vendored_frameworks = [
    'Frameworks/AdsFramework.xcframework',
    'Frameworks/RazorpayAdsSdk.xcframework',
  ]
s.frameworks = 'AdSupport', 'AppTrackingTransparency', 'WebKit'
end
