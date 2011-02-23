@app = lambda do |env|
  [200, {'Content-Type'=>'text/plain'}, 'example']
end

run @app