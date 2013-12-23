class HomeController < ApplicationController
  def index
    player_pool = ["Nick Pettit", "Amit Bijlani", "Chris Michel", "Tommy Morgana", "Jason Seifer"]
    player_pool.shuffle
    @players = [player_pool[0],player_pool[1],player_pool[2],"You"]
    @game = Game.new(@players)
    @game.start
    @scorer = GameScorer.new(@game)
  end
end
