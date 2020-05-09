module ApplicationHelper
  def member_full_name(member)
    "#{member.first_name} #{member.last_name}"    
  end
end
