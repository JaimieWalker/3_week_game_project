class GameCard < ActiveRecord::Base
  belongs_to :game
  belongs_to :card

  def self.cards_in_game(game)
    self.where(game_id: game.id)
  end
end
