require "./Player"
require "./Question"

class Game
  attr_accessor :player_one, :player_two, :current_player

  def initialize
    @player_one = Player.new("Player 1")
    @player_two = Player.new("Player 2")
    @current_player = player_one
  end

  def start
    puts "New Game Started. Let's begin!"
    match
  end 

  def current_score
    puts "P1: #{player_one.lives}/3 vs P2: #{player_two.lives}/3"
  end

  def is_winner(player)
    puts "#{player.name} wins with a score of #{player.lives}/3"
    puts "----- GAME OVER -----"
    puts "See ya!"
    exit(true)
  end

  def check_lives
    if @player_one.lives == 0
      is_winner(@player_two)
    elsif @player_two.lives == 0
      is_winner(@player_one)
    end
  end

  def question(current_player)
    new_question = Question.new
    puts new_question.question_format(current_player)
    print ">> "
    answer = $stdin.gets.chomp

    if new_question.player_answer(answer.to_i) == true
      puts "Yes! You are correct."
    else 
      puts "Seriously? No!"
      current_player.lose_life
    end
  end


  def match 
    question(player_one)
    current_score
    check_lives
    puts "----- NEW TURN -----"
    question(player_two)
    current_score
    check_lives
    puts "----- NEW TURN -----"
    match
  end


end

new_game = Game.new
# p new_game.play

new_game.start