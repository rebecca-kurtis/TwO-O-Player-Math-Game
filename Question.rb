class Question

  attr_accessor :num1, :num2, :answer
  #number options need to be random from 1 to 20
  #question format will be "What does #{num1} plus #{num2} equal?"
  #needs to return the players answer - method player_answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = num1 + num2
  end

  def question_format(current_player)
    "#{current_player.name} > What does #{num1} plus #{num2} equal?"
  end

  def player_answer(answer)
    #returns the player answer to verify if true or not
    @answer == answer
  
  end


end
