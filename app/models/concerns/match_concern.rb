module MatchConcern
  extend ActiveSupport::Concern

  included do
    validates :location, :winner_points, :looser_points, presence: true
    validates :winner_points, :looser_points, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000 }

    belongs_to :winner, class_name: "Member", foreign_key: "winner_id"
    belongs_to :loser, class_name: "Member", foreign_key: "looser_id"
  end
end