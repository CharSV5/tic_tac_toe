require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/board'

class TicTacToe < Sinatra::Base
  # before do
  #   @game = Game.instance
  # end

  get '/' do
    erb :index
  end

  run! if app_file == $0
end
