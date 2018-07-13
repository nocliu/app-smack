project 'Smack.xcodeproj'

platform :ios, '9.0'

target 'Smack' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for Smack
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'Socket.IO-Client-Swift'
  pod 'Firebase'
  pod 'Firebase/Auth'
  pod 'Firebase/Database'
  
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
        end
    end
end
