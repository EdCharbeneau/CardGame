class HomeController < ApplicationController
  def index
    @game = Game.new
    @game.start
  end
end
