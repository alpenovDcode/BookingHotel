platform :ios, '12.0'

target 'BookingHotel' do
  use_frameworks!
  
  pod 'Alamofire', '~> 5.6'
end

post_install do |installer|
     installer.generated_projects.each do |project|
         project.targets.each do |target|
                target.build_configurations.each do |config|
                    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
                  end
              end
          end
      end