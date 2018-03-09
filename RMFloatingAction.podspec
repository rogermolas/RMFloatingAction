#
#  Be sure to run `pod spec lint RMFloatingAction.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "RMFloatingAction"
  s.version      = "1.0"
  s.summary      = "Android like floating action button."

  s.homepage         = 'https://github.com/rogermolas/RMFloatingAction'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Roger Molas' => 'contact@rogermolas.com' }
  s.source           = { :git => 'https://github.com/rogermolas/RMFloatingAction', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/roger_molas'

  s.ios.deployment_target = '10.0'
  s.source_files = 'Source/*.swift'

end
