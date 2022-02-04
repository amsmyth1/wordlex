class WordsController < ApplicationController

  def index
    # binding.pry
    # length = params(:length)
    # @word = words.random_word(length)
  end

  def play
    @random_word_secret = Word.random_word_secret
  end

end
