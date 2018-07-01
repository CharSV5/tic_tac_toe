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
    puts "game: #{@game}!!"
    puts "turn: #{@game.turn}!"
    puts "board: #{@game.board}!"
    field = params[:field]
    puts "field: #{field}"
    play = @game.turn.play(field.to_i)
    puts "Play: #{play}"
    flash[:notice] = 'That square is taken, try again!' if play == nil
    if @game.winner?
      puts 'WINNER!!!'
      redirect('/game_over')
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

  run! if app_file == $0
end
