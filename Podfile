source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

def shared_pods
	pod 'Alamofire', :inhibit_warnings => true
	pod 'SwiftLint'
end

target 'UnitAndUITestApp' do
	shared_pods
end

target 'UnitAndUITestAppTests' do
	shared_pods
end

target 'UnitAndUITestAppUITests' do
	shared_pods
end

