# To use with thin 
#  thin start -p PORT -R config.ru

require File.join(File.dirname(__FILE__), 'lib', 'sammyjs-org.rb')

disable :run
set :environment, :production
run SammyjsOrg