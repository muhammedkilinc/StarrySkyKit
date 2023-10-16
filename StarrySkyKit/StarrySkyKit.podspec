#
#  Be sure to run `pod spec lint StarrySkyKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "StarrySkyKit"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of StarrySkyKit."
  spec.description  = <<-DESC
                      Starry Sky Kit
                   DESC

  spec.homepage     = "https://github.com/muhammedkilinc/StarrySkyKit"
  spec.license      = "MIT"
  spec.authors            = { "Muhammed" => "muhammedkilinc@icloud.com" }
  spec.platform     = :ios, "15.0"
  spec.ios.deployment_target = "15.0"
  spec.source       = { :git => "https://github.com/muhammedkilinc/StarrySkyKit.git", :tag => "#{spec.version}" }
  spec.source_files  = "StarrySkyKit/**/*.swift"
end
