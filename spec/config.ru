@app = lambda do |env|
  [200, {'Content-Type'=>'text/plain'}, 'test']
end

run @app