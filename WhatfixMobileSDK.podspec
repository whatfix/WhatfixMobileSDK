Pod::Spec.new do |s|
  s.name             = 'WhatfixMobileSDK'
  s.version          = '1.1.1'
  s.summary          = 'Whatfix Mobile Contextual Help and Walkthrough Engine.'
  s.homepage         = 'https://github.com/whatfix/WhatfixMobileSDK'
  s.license          = { :type => 'BSD-2-Clause', :file => 'LICENSE' }
  s.author           = { 'Whatfix Mobile Team' => 'support@whatfix.com' }
  s.platform         = :ios, '15.0'
  s.swift_version    = '5.0'
  s.source           = { :http => 'https://github.com/whatfix/WhatfixMobileSDK/releases/download/1.1.1/WhatfixMobileSDK.xcframework.zip', :sha256 => '33a8546c73b57b5c917374236ae1fd67f383278067ebff9a7336f40cccb8f43a' }
  s.vendored_frameworks = 'WhatfixMobileSDK.xcframework'
  s.frameworks       = 'UIKit', 'WebKit', 'Foundation'
  s.libraries        = 'sqlite3'
  s.requires_arc     = true
end
