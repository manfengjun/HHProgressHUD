#
# Be sure to run `pod lib lint HHProgressHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HHProgressHUD'
  s.version          = '0.1.2'
  s.summary          = 'HHProgressHUD SDK'
  s.description      = "Toast Alert Hud Info"

  s.homepage         = 'https://github.com/manfengjun'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jun' => 'chinafengjun@gmail.com' }
  s.source           = { :git => 'https://github.com/manfengjun/HHProgressHUD.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_versions = '5.1'
  s.source_files = 'HHProgressHUD/Classes/**/*'
  s.resource_bundles = {
    'HHProgressHUD' => ['HHProgressHUD/Assets/*{.xcassets}']
  }
  s.dependency 'SwiftEntryKit'
  s.dependency 'PopupDialog'
  s.dependency 'NVActivityIndicatorView'
end
