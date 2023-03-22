require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to be_an(Array)
    expect(deck.cards).to eq([card1, card2, card3])
  end

  it "can get rank of card at specific index in array" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq([card1, card2, card3])
    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(1)).to eq(3)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "can get the high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
    expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it "can get the percent of high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it "can remove the top card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.remove_card).to eq(card1)
    expect(deck.cards).to eq([card2, card3])
    expect(deck.high_ranking_cards).to eq([card3])
  end

  it "can add a card to the top of the deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    card4 = Card.new(:diamond, '5', 5)
    deck.add_card(card4)
    expect(deck.cards).to eq([card1, card2, card3, card4])
    expect(deck.rank_of_card_at(3)).to eq(5)
  end

  # require "pry"; binding.pry
end
