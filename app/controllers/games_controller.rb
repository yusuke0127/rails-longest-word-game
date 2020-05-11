require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @alphabet = Array('A'..'Z')
    puts @alphabet
    @letters = Array.new(10) { @alphabet.sample }
  end

  def score
    # user input
    user_input = params[:word].upcase.split('')
    # letters in the grid
    letters = params[:letters].split
    # validating the word using the wagon dictionary API
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    serialized = open(url).read
    word_json = JSON.parse(serialized)
    # letter_checker = letters.split.map do |letter|
    #   # if word.include?(letter)
    #   #   true
    #   #   # @reply = "Sorry but #{params[:word]} can't be built out of #{@word}"
    #   # end
    # end
    # checks if the user inputtted letter exists in the given grid
    boolean = user_input.any? do |letter|
      puts letters.include?(letter)
      letters.include?(letter)
    end
    # validation for the user input
    puts boolean
    if boolean
      if word_json['found']
        @reply = "Valid word"
      else
        @reply = "Not a valid word"
      end
    else
      @reply = "Sorry not in the grid"
    end
    raise
  end
end
