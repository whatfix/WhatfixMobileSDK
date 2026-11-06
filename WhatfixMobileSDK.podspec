Pod::Spec.new do |s|
  s.name             = 'WhatfixMobileSDK'
  s.version          = '1.1.0'
  s.summary          = 'Whatfix Mobile Contextual Help and Walkthrough Engine.'
  s.homepage         = 'https://github.com/whatfix/WhatfixMobileSDK'
  s.license          = { :type => 'BSD-2-Clause', :file => 'LICENSE' }
  s.author           = { 'Whatfix Mobile Team' => 'support@whatfix.com' }
  s.platform         = :ios, '15.0'
  s.swift_version    = '5.0'
  s.source           = { :http => 'https://github.com/whatfix/WhatfixMobileSDK/releases/download/1.1.0/WhatfixMobileSDK.xcframework.zip', :sha256 => 'cef9b7052474b1e25a95f7df01399dc6e7e54a932bcf9cc43c1e10b454ec8142' }
  s.vendored_frameworks = 'WhatfixMobileSDK.xcframework'
  s.frameworks       = 'UIKit', 'WebKit', 'Foundation'
  s.libraries        = 'sqlite3'
  s.requires_arc     = true
end
