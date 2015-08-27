require 'bundler/setup'
require 'sinatra'

set :static, true
set :views, 'views'

stylesheets = "public/stylesheets"

def read_haml(name)
  File.read(File.join('views', "#{name}.haml"))
end

def read_scss(name)
  File.read(File.join('public/stylesheets/sass', "#{name}.scss"))
end

def read_css(name)
  File.read(File.join('public/stylesheets', "#{name}.css"))
end


get '/' do
  haml :intro
end


get '/variables' do
  name = 'variables'

  haml_code = read_haml(name)
  scss_code = read_scss(name)
  css_code = read_css(name)
  
  haml :variables, locals: {
    'haml_code' => haml_code,
    'scss_code' => scss_code,
    'css_code' => css_code
  }
end


get '/nesting' do
  name = 'nesting'

  haml_code = read_haml(name)
  scss_code = read_scss(name)
  css_code = read_css(name)

  haml :nesting, locals: {
    'haml_code' => haml_code,
    'scss_code' => scss_code,
    'css_code' => css_code
  }
end


get '/partials' do
  name = 'partials'

  haml_code = read_haml(name)
  scss_code = read_scss(name)
  scss_partial_code = read_scss('_circle')
  css_code = read_css(name)

  haml :partials, locals: {
    'haml_code' => haml_code,
    'scss_code' => scss_code,
    'scss_partial_code' => scss_partial_code,
    'css_code' => css_code
  }
end


get '/extend' do
  name = 'extend'

  haml_code = read_haml(name)
  scss_code = read_scss(name)
  css_code = read_css(name)

  haml :extend, locals: {
    'haml_code' => haml_code,
    'scss_code' => scss_code,
    'css_code' => css_code
  }
end


get '/mixins' do
  name = 'mixins'

  haml_code = read_haml(name)
  scss_code = read_scss(name)
  css_code = read_css(name)

  haml :mixins, locals: {
    'haml_code' => haml_code,
    'scss_code' => scss_code,
    'css_code' => css_code
  }
end

get '/operations' do
  name = 'operations'

  haml_code = read_haml(name)
  scss_code = read_scss(name)
  css_code = read_css(name)

  haml :operations, locals: {
    'haml_code' => haml_code,
    'scss_code' => scss_code,
    'css_code' => css_code
  }
end



get '/test' do
  
  haml_code = File.read(File.join('views', 'test.haml'))
  scss_code = File.read(File.join(stylesheets + '/sass', 'test.scss'))
  css_code = File.read(File.join(stylesheets, 'test.css'))

  haml :test, locals: { 
    'haml_code' => haml_code,
    'scss_code' => scss_code,
    'css_code' => css_code
  }
end
