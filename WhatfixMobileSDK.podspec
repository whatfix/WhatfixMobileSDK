Pod::Spec.new do |s|
  s.name             = 'WhatfixMobileSDK'
  s.version          = '0.0.1'
  s.summary          = 'Whatfix Mobile Contextual Help and Walkthrough Engine.'
  s.homepage         = 'https://github.com/whatfix/WhatfixMobileSDK'
  s.license          = { :type => 'BSD-2-Clause', :file => 'LICENSE' }
  s.author           = { 'Whatfix Mobile Team' => 'support@whatfix.com' }
  s.platform         = :ios, '15.0'
  s.swift_version    = '5.0'
  s.source           = { :http => 'https://github.com/whatfix/WhatfixMobileSDK/releases/download/0.0.1/WhatfixMobileSDK.xcframework.zip', :sha256 => '0c8375202bd271cfdb47fa839d3cf0e712cb264470cc4cfac32d05a333b07594' }
  s.vendored_frameworks = 'WhatfixMobileSDK.xcframework'
  s.frameworks       = 'UIKit', 'WebKit', 'Foundation'
  s.libraries        = 'sqlite3'
  s.requires_arc     = true
end
