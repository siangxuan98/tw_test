# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'tw_test_production' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for tw_test_production
  
  pod 'R.swift', '~> 6.1.0'
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'Alamofire', '~> 4.8.2'
  pod 'RxAlamofire'
  
  pod 'SwiftyJSON'
  pod 'Localize-Swift', '~> 3.2'
  pod 'MBProgressHUD', '~> 1.1.0'
  pod 'Kingfisher', '~> 5.0'
  pod 'SwiftyGif'
  pod 'IBAnimatable'
  pod 'AlertToast', '~> 1.3.9'
  pod 'FLAnimatedImage', '~> 1.0'
  pod 'lottie-ios'

end

target 'tw_test_staging' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for tw_test_staging
  
  pod 'R.swift', '~> 6.1.0'
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'Alamofire', '~> 4.8.2'
  pod 'RxAlamofire'
  
  pod 'SwiftyJSON'
  pod 'Localize-Swift', '~> 3.2'
  pod 'MBProgressHUD', '~> 1.1.0'
  pod 'Kingfisher', '~> 5.0'
  pod 'SwiftyGif'
  pod 'IBAnimatable'
  pod 'AlertToast', '~> 1.3.9'
  pod 'FLAnimatedImage', '~> 1.0'
  pod 'lottie-ios'

end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
               end
          end
   end
end
