require 'spec_helper'

describe Miso do
  it 'should load config.ru' do
    app = Miso.load 'spec'
    code, headers, body = app.call({:dummy => 'dummy'})
    code.should == 200
    headers['Content-Type'].should == 'text/plain'
    body.should == 'test'       
  end 
end