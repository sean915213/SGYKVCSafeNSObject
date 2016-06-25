#
# Be sure to run `pod lib lint SGYKVCSafeNSObject.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = "SGYKVCSafeNSObject"
    s.version          = "1.0.1"
    s.summary          = "A category on NSObject that converts key value coding exceptions to NSError objects."

    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    s.description      = "Provides a safe way to use key value coding on NSObject.  Since Swift does not support ObjC's @try command it cannot catch the exceptions thrown using key value coding (eg. setValue:forKey).  This library provides an extension on NSObject that will catch these exceptions and report them via NSError so that they can be safely used in Swift."

    s.homepage         = "https://github.com/sean915213/SGYKVCSafeNSObject"
    # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
    s.license          = 'MIT'
    s.author           = { "Sean G Young" => "sean.g.young@gmail.com" }
    s.source           = { :git => "https://github.com/sean915213/SGYKVCSafeNSObject.git", :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

    s.ios.deployment_target = '8.0'
    s.source_files = 'SGYKVCSafeNSObject/Classes/**/*'
    #s.source_files = 'Pod/Classes/**/*'

    # s.resource_bundles = {
    #   'SGYKVCSafeNSObject' => ['SGYKVCSafeNSObject/Assets/*.png']
    # }

    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
