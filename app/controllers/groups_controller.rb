class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find_by(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(groups_params)
  end

  def edit
    @group = Group.find_by(params[:id])
  end

  def update
    @group = Group.find_by(params[:id])
    @group.update(group_params)
  end

  def delete
    @group = Group.find_by(params[:id])
    @group.destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
