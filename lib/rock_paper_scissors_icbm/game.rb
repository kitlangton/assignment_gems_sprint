require 'highline/import'
require 'rainbow'

module RockPaperScissorsIcbm
class Game

  WINNING_MOVES = {
    rock: :scissors,
    scissors: :paper,
    paper: :rock
  }

  def initialize
    @winner = nil
  end

  def play
    until winner?
      ask_player_throw
    end
  end

  def ask_player_throw
    loop do
      input = ask "What's your throw? (#{bold('Rock')}, #{bold('Paper')}, or #{bold('Scissors')}?) -- or #{icbm}?"
      player_throw = validate_input(input)

      unless player_throw
        puts "Invalid input."
        next
      end

      puts
      determine_winner(player_throw)

      if draw?
        display_draw
        next
      elsif everyone_dead?
        display_nuclear_holocaust
      elsif computer_won?
        display_computer_won(player_throw)
      else
        display_player_won(player_throw)
      end

      break
    end
  end

  def display_computer_won(player_throw)
    display_hands(player_throw)
    puts "Therefore the computer bested you. Goodbye."
  end

  def display_player_won(player_throw)
    display_hands(player_throw)
    puts "Therefore you won!"
    puts Rainbow("Good for you!").white.bright
  end

  def display_hands(player_throw)
    puts "You chose #{bold(player_throw.to_s.capitalize)} and the computer chose #{bold(@computer_throw.to_s.capitalize)}"
  end

  def display_draw
    puts "You and the computer both chose #{bold(@computer_throw.to_s.capitalize)}."
    puts "So it's a draw."
    puts Rainbow("Try Again!").red
    puts
  end

  def determine_winner(player_throw)
    @computer_throw = random_throw
    @winner = :draw if player_throw == @computer_throw
    @winner = :everyone_dies if player_throw == :icbm
    @winner = :player if  WINNING_MOVES[player_throw] == @computer_throw
    @winner = :computer if  WINNING_MOVES[@computer_throw] == player_throw
  end

  def display_nuclear_holocaust
    output = []
output << '   _  __ __  __ _____ __    ____ ___    ___      __ __ ____   __   ____   _____ ___   __  __ ____ ______'
output << '  / |/ // / / // ___// /   / __// _ |  / _ \    / // // __ \ / /  / __ \ / ___// _ | / / / // __//_  __/'
output << ' /    // /_/ // /__ / /__ / _/ / __ | / , _/   / _  // /_/ // /__/ /_/ // /__ / __ |/ /_/ /_\ \   / /   '
output << '/_/|_/ \____/ \___//____//___//_/ |_|/_/|_|   /_//_/ \____//____/\____/ \___//_/ |_|\____//___/  /_/    '
    output.each do |line|
      line.each_char do |char|
        print bold(char)
        sleep 0.001
      end
      puts
    end
    puts
    puts "Now we're all sons of bitches."
  end

  def draw?
    @winner == :draw
  end

  def random_throw
    WINNING_MOVES.keys.sample
  end

  def everyone_dead?
    @winner == :everyone_dies
  end

  def validate_input(string)
    case string.downcase
    when /rock/
      return :rock
    when /paper/
      return :paper
    when /scissors/
      return :scissors
    when /icbm/
      return :icbm
    else
      return false
    end
  end

  def bold(string)
    Rainbow(string).bright.white
  end

  def icbm
    Rainbow("ICBM").underline.red
  end

  def computer_won?
    @winner == :computer
  end

  def winner?
    !@winner.nil?
  end
end
end
