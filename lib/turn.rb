class Turn

  attr_reader :player1, :player2, :spoils_of_war, :type
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = :basic
  end

  def winner
    if @type == :basic
      if player1.rank_of_card_at(0) > player2.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif @type == :war
      if player1.rank_of_card_at(2) > player2.rank_of_card_at(2)
        player1
      else
        player2
      end
    elsif @type == :mutually_assured_destruction
      "No Winner"
    end
  end

end