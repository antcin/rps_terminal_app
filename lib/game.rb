class Game

  WEAPONS = ['r', 'p', 's']

  def initialize(std_out = $stdout, std_in = $stdin)
    @std_out = std_out
    @std_in = std_in
  end

  def prompt
    @std_out.write("Choose your weapon: r/p/s\n")
  end

  def select
    @std_in.read
  end

  def check_input(select)
    raise 'Not a valid choice' unless WEAPONS.include?(select)
  end

  def computer_choice
    WEAPONS.sample
  end

  def outcome(player_choice, computer_choice)
   return 'Computer wins' if computer_choice == 's' && player_choice == 'p'
   return 'Computer wins' if computer_choice == 'paper' && player_choice == 'rock'
   return 'Computer wins' if computer_choice == 'rock' && player_choice == 'scissors'
   return 'Draw' if computer_choice == player_choice
   "Player wins"
  end




end
