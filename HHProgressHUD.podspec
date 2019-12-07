#
# Be sure to run `pod lib lint HHProgressHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HHProgressHUD'
  s.version          = '0.1.0'
  s.summary          = 'Toast Alert Hud'
  s.description      = "Toast Alert Hud"

  s.homepage         = 'https://github.com/manfengjun'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jun' => 'chinafengjun@gmail.com' }
  s.source           = { :git => 'https://github.com/manfengjun/HHProgressHUD.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  # s.source_files = 'JJEx/Classes/**/*'
  s.subspec 'Core' do |c|
      c.dependency 'SwiftEntryKit'
      c.dependency 'PopupDialog'
      c.dependency 'NVActivityIndicatorView'
      c.source_files = 'HHProgressHUD/Classes/Core/**/*'
  end
  s.subspec 'Toast' do |t|
      t.dependency "HHProgressHUD/Core"
      t.source_files = 'HHProgressHUD/Classes/Toast/**/*'
  end
  s.subspec 'Hud' do |h|
      h.dependency "HHProgressHUD/Core"
      h.source_files = 'HHProgressHUD/Classes/Hud/**/*'
  end
  s.subspec 'Alert' do |a|
      a.dependency "HHProgressHUD/Core"
      a.source_files = 'HHProgressHUD/Classes/Alert/**/*'
  end
   s.resource_bundles = {
     'HHProgressHUD' => ['HHProgressHUD/Assets/*{.xcassets}']
   }
end
