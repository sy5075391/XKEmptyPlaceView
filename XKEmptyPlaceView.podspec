#
# Be sure to run `pod lib lint XKEmptyPlaceView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XKEmptyPlaceView'
  s.version          = '2.0.0'
  s.summary          = 'emptyPlaceView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  基于scrollView的无数据，无网络占位图
                       DESC

  s.homepage         = 'https://github.com/sy5075391/XKEmptyPlaceView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sy5075391' => '447523382@qq.com' }
  s.source           = { :git => 'https://github.com/sy5075391/XKEmptyPlaceView.git', :tag => "#{s.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'XKEmptyPlaceView/Classes/**/*'

  # s.resource_bundles = {
  #   'XKEmptyPlaceView' => ['XKEmptyPlaceView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
