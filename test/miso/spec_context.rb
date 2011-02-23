require 'miso/context'
require 'bacon'

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
    @app = Miso::Context.new @dummy_app, :app_path => '/test' 
    @initial_env = {'REQUEST_PATH' => '/test/hello', 'PATH_INFO' => '/test/hello', 'REQUEST_URI' => '/test/hello'} 
  end

  it 'should return app return value' do
    code, header, body = @app.call(@initial_env)
    code.should.equal 200
    header['header'].should.equal 'value'
    body.should.equal 'body'      
  end
  
  it 'should rewrite path' do
    code, header, body = @app.call(@initial_env)
    code.should.equal 200
    header['header'].should.equal 'value'
    body.should.equal 'body'
    @dummy_app.env['REQUEST_PATH'].should.equal '/hello'  
  end
end