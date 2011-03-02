require 'spec_helper'

describe Miso::StaticSite do
  it 'should return serve files from directory' do
    initial_env = {'PATH_INFO' => '/spec_helper.rb'}
    app = Miso::StaticSite.new 'spec' 
    code, header, body = app.call(initial_env)
    code.should  == 200
    body.instance_of? Rack::File
    body.path.should match(/spec_helper.rb/)     
  end
  
  it 'should map / to index.html' do
    initial_env = {'PATH_INFO' => '/'}
    app = Miso::StaticSite.new 'spec' 
    code, header, body = app.call(initial_env)
    code.should  == 200
    body.instance_of? Rack::File
    body.path.should match (/index.html/)     
  end
end