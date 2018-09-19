#
# Be sure to run `pod lib lint RMFloatingAction.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RMFloatingAction'
  s.version          = '0.1.1'
  s.summary          = '"Android like floating action button."'

  s.homepage         = 'https://github.com/rogermolas/RMFloatingAction'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rogermolas' => 'contact@rogermolas.com' }
  s.source           = { :git => 'https://github.com/rogermolas/RMFloatingAction.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/roger_molas'

  s.ios.deployment_target = '8.0'
  s.source_files = 'RMFloatingAction/Classes/**/*'

end
