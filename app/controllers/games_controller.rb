require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ("a".."z").to_a.sample
    end
  end

  def score
    @answer = params[:word]
    url = "https://dictionary.lewagon.com/#{@answer}"
    json = URI.open(url).read
    results = JSON.parse(json)
    @found = results["found"]
    @puzzle = params[:letters]
    @tfarr = @answer.chars.map do |char|
      @puzzle.count(char) >= @answer.count(char)
    end
  end
end
