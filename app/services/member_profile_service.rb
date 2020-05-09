class MemberProfileService

  def initialize(member)
    @member = member
  end

  def call
    member_profile_attributes
  end

  def leader_board
    {
      total_match: total_wins + total_losses,
      average_score: average_score,
      member: @member
    }
  end

  private

  def total_wins
    @member.wins.count
  end

  def total_losses
    @member.losses.count
  end

  def average_score
    (total_wins > 0 || total_losses > 0) ?
      (total_wins_score + total_losses_score) / (total_wins + total_losses) : 0
  end

  def total_wins_score
    total_winning_points = @member.wins.pluck(:winner_points).inject(:+) 
    total_winning_points = total_winning_points.nil? ? 0 : total_winning_points
    return total_winning_points
  end

  def total_losses_score
    total_lossing_points = @member.losses.pluck(:looser_points).inject(:+) 
    total_lossing_points = total_lossing_points.nil? ? 0 : total_lossing_points
    return total_lossing_points
  end

  def highest_score
    winner = @member.wins.order(winner_points: :desc, created_at: :desc).first
    losser = @member.losses.order(looser_points: :desc, created_at: :desc).first
    score = if winner.present? && losser.present?
              winner.winner_points >= losser.looser_points ? highest_score_hash(winner, true) : highest_score_hash(losser, false)
            elsif winner.present? && !losser.present?
              highest_score_hash(winner, true)
            elsif !winner.present? && losser.present?
              highest_score_hash(losser, false)
            else
              nil
            end
              
  end

  def highest_score_hash(match, is_winner)
    if is_winner
      {
        points: match.winner_points,
        date: match.created_at,
        location: match.location,
        opponent: match.loser
      }
    else
      {
        points: match.looser_points,
        date: match.created_at,
        location: match.location,
        opponent: match.winner
      }
    end
  end

  def member_profile_attributes
    {
      number_of_wins: total_wins,
      number_of_losses: total_losses,
      average_score: average_score,
      highest_score: highest_score
    }
  end
end