require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  describe "can create a turn with players" do
    it "exists" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      expect(turn).to be_a(Turn)
    end

    it "has player attributes" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.type

      expect(turn.player1).to be_an_instance_of(Player)
      expect(turn.player2).to be_an_instance_of(Player)
      expect(turn.player1.name).to eq("Megan")
      expect(turn.player2.name).to eq("Aurora")
      expect(turn.spoils_of_war).to eq([])
      expect(turn.type).to eq(:basic)
    end

    it "can determine winner" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.type
      winner = turn.winner

      expect(winner.name).to eq("Megan")
    end

    it "can determine spoils of war" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.type
      winner = turn.winner
      turn.pile_cards

      expect(turn.spoils_of_war).to be_an_instance_of(Array)
      expect(turn.spoils_of_war).to eq([card1, card3])
    end

    it "can award spoils to the winner" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.type
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)

      expect(turn.player1.deck.cards).to eq([card2, card5, card8, card1, card3])
      expect(turn.player2.deck.cards).to eq([card4, card6, card7])
    end

    # it "can award spoils to the winner after a :war turn" do
    #   card1 = Card.new(:heart, 'Jack', 11)
    #   card2 = Card.new(:heart, '10', 10)
    #   card3 = Card.new(:heart, '9', 9)
    #   card4 = Card.new(:diamond, 'Jack', 11)
    #   card5 = Card.new(:heart, '8', 8)
    #   card6 = Card.new(:diamond, 'Queen', 12)
    #   card7 = Card.new(:heart, '3', 3)
    #   card8 = Card.new(:diamond, '2', 2)

    #   deck1 = Deck.new([card1, card2, card5, card8])
    #   deck2 = Deck.new([card4, card3, card6, card7])
    #   player1 = Player.new("Megan", deck1)
    #   player2 = Player.new("Aurora", deck2)
    #   turn = Turn.new(player1, player2)
    #   turn.type
    #   winner = turn.winner
      
    #   turn.pile_cards
    
    #   turn.award_spoils(winner)
      
    #   expect(turn.player1.deck.cards).to eq([card8])
    #   expect(turn.player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
    # end
  end

end