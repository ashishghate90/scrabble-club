class MatchValidator < ActiveModel::Validator

  def validate(record)
    if (record.winner_id.present? && record.looser_id.present?) && (record.winner_id == record.looser_id)
      record.errors.add(:winner_id, "both members must be different")
    end

    if (record.winner_points.present? && record.looser_points.present?) && (record.winner_points < record.looser_points)
      record.errors.add(:winner_points, "can't less than Loosing points")
    end
  end
end