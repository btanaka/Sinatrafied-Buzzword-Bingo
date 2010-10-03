require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'

class Bwb < Sinatra::Base
  get '/' do
    'Hello World!'
  end
end

# TODO: add some methods in the class and call from bwb.rb

Bwb.run!