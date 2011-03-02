require 'spec_helper'

describe Miso::Context do
  before do
    @initial_env = {'REQUEST_PATH' => '/spec/hello', 'PATH_INFO' => '/spec/hello', 'REQUEST_URI' => '/spec/hello'} 
  end

  it 'should return app return value' do
    mock_app = mock('mock_app')
    mock_app.should_receive(:call).with(@initial_env).once.and_return([200, {'header' => 'value'}, 'body'])
    app = Miso::Context.new mock_app, :app_path => '/spec' 
    code, header, body = app.call(@initial_env)
    code.should  == 200
    header['header'].should == 'value'
    body.should  == 'body'      
  end
  
  it 'should rewrite path' do
    expected_env = {'REQUEST_PATH' => '/hello', 'PATH_INFO' => '/hello', 'REQUEST_URI' => '/hello'} 
    mock_app = mock('mock_app')
    mock_app.should_receive(:call).with(expected_env).once.and_return([200, {'header' => 'value'}, 'body'])
    app = Miso::Context.new mock_app, :app_path => '/spec' 
    code, header, body = app.call(@initial_env)
    code.should == 200
    header['header'].should == 'value'
    body.should  == 'body'  
  end
end