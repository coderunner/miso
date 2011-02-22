require 'miso/context'
require 'bacon'

class DummyApp
  def call(env)
    @env = env
    [200, {'header' => 'value'}, 'body']
  end
  
  
end
describe Miso::Context do
  before do
    @app = Miso::Context.new DummyApp.new, :app_path => ''
  end

  it 'should return app return value' do
    code, header, body = @app.call(nil)
    code.should.equal 200
    header['header'].should.equal 'value'
    body.should.equal 'body'      
  end
end