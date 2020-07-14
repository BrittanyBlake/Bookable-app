class GroupsController < ApplicationController
  def index
    @user = current_user
    @groups = Group.where(user: current_user).ordered_alphabetically
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      flash[:notice] = 'You have made a new group'
      redirect_to @group
    else
      flash.now[:alert] = 'something went wrong'
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @books = @group.books
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
