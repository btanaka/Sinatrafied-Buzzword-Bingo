require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'erb'

class Bwb < Sinatra::Base
    set :static, true
    set :public, File.dirname(__FILE__) + '/public'

  get '/' do
    @title = 'Sinatrified Buzzword Bingo'

    # make an array here to reveal in erb template
    # TODO: make the array stuff presentable
    @buzzwords = Array.new

    # read the contents of buzzfile and stuff it into the array
    f = File.open("./buzzfile") or die "Unable to open file..."
    #contentsArray=[]  # start with an empty array
    f.each_line {|line|
        #contentArray.push line
        @buzzwords.push line
    }

    @sortedbuzz = Array.new
    @sortedbuzz = @buzzwords.sort

    # shuffle array and truncate to 24
    @buzzwords = @buzzwords.sort_by { rand }
    #@buzzwords = @buzzwords[0..23]

    # meh slice up the array into row arrays.
    # is this disgusting?
    @bwr1 = Array.new
    @bwr2 = Array.new
    @bwr3a = Array.new
    @bwr3b = Array.new
    @bwr4 = Array.new
    @bwr5 = Array.new
    @bwr1 = @buzzwords[0..4] # row1
    @bwr2 = @buzzwords[5..9] 
    @bwr3a = @buzzwords[10..11] 
    @bwr3b = @buzzwords[12..13]
    @bwr4 = @buzzwords[14..18]
    @bwr5 = @buzzwords[19..23]

    erb :index
  end
end
