platform :ios, '11.0'

target 'Flash Chat iOS13' do
  use_frameworks!
  pod 'FirebaseAuth'
  pod 'FirebaseFirestore'
  
  pod 'CLTypingLabel', '~> 0.4.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'BoringSSL-GRPC'
      target.source_build_phase.files.each do |file|
        if file.settings && file.settings['COMPILER_FLAGS']
          flags = file.settings['COMPILER_FLAGS'].split
          flags.reject! { |flag| flag == '-GCC_WARN_INHIBIT_ALL_WARNINGS' }
          file.settings['COMPILER_FLAGS'] = flags.join(' ')
        end
      end
    end
  end
end