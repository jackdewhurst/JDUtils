#
# Be sure to run `pod lib lint JDUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
	s.name             = 'JDUtils'
	s.version          = '0.1.8'
	s.summary          = 'A collection of Objective-C class categories and useful methods for iOS development'

	s.description      = <<-DESC
							See https://www.omnifi.co.uk/labs/grow-your-own-cocoapo for more information and instructions.
						DESC

	s.homepage         = 'https://github.com/jackdewhurst/JDUtils'
	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { 'Jack Dewhurst' => 'jack@lupd.co' }
	s.source           = { :git => 'https://github.com/jackdewhurst/JDUtils.git', :tag => s.version.to_s }

	s.ios.deployment_target = '7.0'

	s.source_files = 'JDUtils/Classes/**/*'

	source_files = 'Pod/Classes/**/*'
	s.resource_bundles = {
	  'JDAdditions' => ['Pod/Assets/*.png']
	}

	s.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) JD_LOGO_FONT=\'@\"Helvetica-Neue\"\' JD_APP_BOLD_FONT=\'@\"Helvetica-Neue\"\' JD_APP_FONT=\'@\"Helvetica-Neue\"\' JD_APP_LIGHT_FONT=\'@\"Helvetica-Neue\"\' JD_BLACK_COLOR=\'@\"#000000\"\' JD_WHITE_COLOR=\'@\"#FFFFFF\"\' JD_DARK_GREY_COLOR=\'@\"#333333\"\' JD_GREY_COLOR=\'@\"#555555\"\' JD_SEMI_LIGHT_GREY_COLOR=\'@\"#CCCCCC\"\' JD_LIGHT_GREY_COLOR=\'@\"#DDDDDD\"\' JD_REALLY_LIGHT_GREY_COLOR=\'@\"#E5E5E5\"\' JD_NAVBAR_HEIGHT=\'44\'" }

end
