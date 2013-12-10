$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'motion-cocoapods' # pods
require 'nano-store' # NanoStore
require 'bubble-wrap'
require 'sugarcube-repl'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'NanoCat'
  app.info_plist['UIMainStoryboardFile'] = 'NanoStore'
  app.info_plist['CFBundleURLTypes'] = [
    { 'CFBundleURLName' => 'com.factor.NanoCat', }
  ]
  app.provisioning_profile = '../../cert/factor_debug.mobileprovision'
end
