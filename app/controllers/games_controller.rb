require

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]
    @include = @word.chars.all? { |letter| params[:word].count(letter) <= @word.count(letter) }
    p @include
    if @include
      if english_word
        'well done'
      else
        'not an english word'
      end
    else
      'not in the grid'
    end
  end

  def english_word
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    json = JSON.parse(open(url).read)
    json['found']
  end
end
