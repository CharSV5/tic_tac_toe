require 'sinatra/base'
require 'sinatra/flash'
require './lib/player'
require './lib/game'
require './lib/board'

class TicTacToe < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @game = Game.create
    session[:game] = @game
    session[:game].run
    print "game: #{@game}!!"
    erb :index
  end

  post '/play' do
    @game = session[:game]
    field = params[:field]
    play = @game.turn.play(field.to_i) if field.between?('1','9')
    if @game.winner?
      puts 'WINNER!!!'
      redirect('/game_over')
    elsif play.nil?
      flash[:notice] = 'That is not a legitimate move, please choose a free square from 1 - 9'
      redirect('/play')
    else
      flash[:notice] = 'The game ended in a tie, choose new game to play again!' if @game.draw?
      @game.switch_player_turn
      redirect('/play')
    end
  end

  get '/game_over' do
    @game = session[:game]
    erb :game_over
  end

  get '/play' do
    @game = session[:game]
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
