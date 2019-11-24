require_relative 'card.rb'

# Poker Hand Evaluation
# TODO: Basically, extend this class (you can create another class, of course!)
class Hand
  attr_reader :cards, :rank

  def initialize(draw_cards)
    @cards = draw_cards.map { |str| Card.new(str) }
    @rank = categorize
  end

  private

  def categorize
      p @cards.map{|card| card.face}.uniq
      if @cards.map{|card| card.suit}.uniq.length == 1
        return 'flush'
      elsif @cards.map{|card| card.face}.uniq.length == 2  && @cards.map{|card| card.suit}.uniq.length == 4
        return 'four-of-a-kind'
      elsif @cards.map{|card| card.face}.uniq.length == 2
        return 'full-house'
      elsif @cards.map{|card| card.face}.uniq.length == 3
        return 'two-pair'
      elsif @cards.map{|card| card.face}.uniq.length == 4
        return 'one-pair'
      else
        #フラッシュ以外
        return 'high-card'
      end
  end
end