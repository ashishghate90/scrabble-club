class Match < ApplicationRecord
  include ActiveModel::Validations
  validates_with MatchValidator
  include MatchConcern
end
