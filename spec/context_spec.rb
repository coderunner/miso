require 'spec_helper'

#should be mock!
class DummyApp
  def call(env)
    @env = env
    [200, {'header' => 'value'}, 'body']
  end
  
  def env
    @env
  end
end

describe Miso::Context do
  before do
    @dummy_app = DummyApp.new
    @app = Miso::Context.new @dummy_app, :app_path => '/spec' 
    @initial_env = {'REQUEST_PATH' => '/spec/hello', 'PATH_INFO' => '/spec/hello', 'REQUEST_URI' => '/spec/hello'} 
  end

  it 'should return app return value' do
    code, header, body = @app.call(@initial_env)
    code.should  == 200
    header['header'].should == 'value'
    body.should  == 'body'      
  end
  
  it 'should rewrite path' do
    code, header, body = @app.call(@initial_env)
    code.should == 200
    header['header'].should == 'value'
    body.should  == 'body'
    @dummy_app.env['REQUEST_PATH'].should  == '/hello'
    @dummy_app.env['PATH_INFO'].should  == '/hello'
    @dummy_app.env['REQUEST_URI'].should  == '/hello'  
  end
end