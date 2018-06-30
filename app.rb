require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/board'

class TicTacToe < Sinatra::Base
  enable :sessions

  get '/' do
    @game = Game.create
    session[:game] = @game
    session[:game].run
    print "game: #{@game}!!"
    erb :index
  end

  post '/play' do
    @game = session[:game]
    print "game: #{@game}!!"
    print "turn: #{@game.turn}!"
    print "board: #{@game.board}!"
    field = params[:field]
    @game.turn.play(field.to_i)
    redirect('/play')
  end

  get '/play' do
    @game = session[:game]
    erb :index
  end

  run! if app_file == $0
end
