Pod::Spec.new do |s|

  s.name         = "ATKit"
  s.version      = "0.0.4"
  s.summary      = "A collection of iOS components"

  s.description  = <<-DESC
                   A collection of iOS components
                   一些基础类的功能扩展和一些常用的控件封装
                   DESC

  s.homepage     = "https://github.com/AesirTitan/ATKit"

  s.license      = "MIT"

  s.author             = { "Aesir" => "ayan.bifrost@gmail.com" }


  s.platform     = :ios
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = '7.0'
  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/AesirTitan/ATKit.git", :tag => "#{s.version}" }

  s.source_files  = "ATKit/**/*.{h,m}"
  # s.default_subspec = 'All'
  # s.subspec 'All' do |ss|
  #   ss.dependency 'ATKit/ATFoundation'
  #   ss.dependency 'ATKit/ATCarousel'
  #   ss.dependency 'ATKit/ATDrawer'
  #   ss.dependency 'ATKit/ATTabBar'
  # end
  #
  # s.subspec 'ATFoundation' do |ss|
  #   ss.source_files = 'ATKit/*.{h,m}'
  #   ss.source_files = 'ATKit/ATFoundation/*.{h,m}', 'ATKit/Foundation/**/*.{h,m}'
  # end
  # s.subspec 'ATCarousel' do |ss|
  #   ss.source_files = 'ATKit/ATCarousel/*.{h,m}'
  # end
  # s.subspec 'ATDrawer' do |ss|
  #   ss.source_files = 'ATKit/ATDrawer/*.{h,m}'
  # end
  # s.subspec 'ATTabBar' do |ss|
  #   ss.source_files = 'ATKit/ATTabBar/*.{h,m}'
  # end

  # s.exclude_files = "Classes/Exclude"
  # s.public_header_files = 'ATKit/**/*.{h}'

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  s.frameworks = "Foundation", "UIKit"
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
