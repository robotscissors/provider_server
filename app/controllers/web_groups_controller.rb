class WebGroupsController < ApplicationController
  def new
    @web_group = WebGroup.new
  end
  def index
    @web_groups = WebGroup.all
  end

  def show
    @web_group = WebGroup.find(params[:id])
  end

  def edit
    @web_group = WebGroup.find(params[:id])
  end

  def create
    @web_group = WebGroup.new
    @web_group.group_name = params[:web_group][:group_name]
    @web_group.description = params[:web_group][:description]

    if @web_group.save
      flash[:notice] = "New webgroup created!"
      # create_session(@user)
      redirect_to @web_group
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  def update
    @web_group = WebGroup.find(params[:id])
    @web_group.assign_attributes(web_group_params)
    @web_group.group_name = params[:web_group][:group_name]
    @web_group.description = params[:web_group][:description]

    if @web_group.save
      flash[:notice] = "Your update was saved correctly!"
      redirect_to [@web_group]
    else
      flash[:alert] = "There was an error when we tried to save it. Try again."
      render :edit
    end
  end

  def destroy
    @web_group = WebGroup.find(params[:id])
    if @web_group.destroy
      flash[:notice] = "\"#{@web_group.group_name}\" was deleted succesfully."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an issue deleting the post."
      render :show
    end
  end

  private
  # Using a private method to encapsulate the permissible parameters
  def web_group_params
    params.require(:web_group).permit(:group_name, :description)
  end

end
