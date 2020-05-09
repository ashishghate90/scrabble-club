class LeaderboardService
  def initialize()
    @members = Member.all
    @filtered_members = []
  end

  def call
    leader_board_members
  end

  private

  def leader_board_members
    @members.each do |member|
      member = MemberProfileService.new(member).leader_board
      if member[:total_match] >= 10
        @filtered_members << member
      end
    end
    @filtered_members.present? ? 
      @filtered_members.sort {|a,b| a[:average_score] <=> b[:average_score]}.reverse.take(10) :
      nil
  end

end