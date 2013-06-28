# require File.expand_path('../config/boot.rb', __FILE__)
# require 'padrino-core/cli/rake'
# PadrinoTasks.init


task :screenshot do
  require 'screencap'
  Screencap::Fetcher.new('http://www.google.com').fetch(
    :output => 'brenfrow.png',
    :div => 'body',
    :width => 800
  )
end
