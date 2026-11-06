Pod::Spec.new do |s|
  s.name             = 'WhatfixMobileSDK'
  s.version          = '1.0.1'
  s.summary          = 'Whatfix Mobile Contextual Help and Walkthrough Engine.'
  s.homepage         = 'https://github.com/whatfix/WhatfixMobileSDK'
  s.license          = { :type => 'BSD-2-Clause', :file => 'LICENSE' }
  s.author           = { 'Whatfix Mobile Team' => 'support@whatfix.com' }
  s.platform         = :ios, '15.0'
  s.swift_version    = '5.0'
  s.source           = { :http => 'https://github.com/whatfix/WhatfixMobileSDK/releases/download/1.0.1/WhatfixMobileSDK.xcframework.zip', :sha256 => '6bfc88f5a9e8212831caadca86d6fef1c65647bd3055021ff72267777a2e1001' }
  s.vendored_frameworks = 'WhatfixMobileSDK.xcframework'
  s.frameworks       = 'UIKit', 'WebKit', 'Foundation'
  s.libraries        = 'sqlite3'
  s.requires_arc     = true
end
