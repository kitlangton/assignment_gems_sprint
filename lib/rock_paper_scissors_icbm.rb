require "rock_paper_scissors_icbm/version"
require 'rock_paper_scissors_icbm/game'

module RockPaperScissorsIcbm
  def self.play
    Game.new.play
  end
end
