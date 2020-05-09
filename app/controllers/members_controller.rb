class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update]

  def index
    @leader_boards_members = LeaderboardService.new().call
  end

  def show
    @member_details = MemberProfileService.new(@member).call
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member, notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  def update
      if @member.update(member_params)
        redirect_to @member, notice: 'Member was successfully updated.'
      else
        render :edit
      end
  end

  private
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:first_name, :last_name, :contact_number)
    end
end
