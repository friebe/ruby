class ProjectsController < ApplicationController

  before_action :redirect_if_not_logged_in
  before_action :fetch_project_from_params, only: [:show, :edit, :destroy, :update]
  before_action :redirect_unless_authorized, only: [:show, :edit, :destroy, :update]
  before_action :redirect_unless_admin, only: [:new, :create]

  def index
    @headline = 'List'

    if current_user.admin
      @projects = Project.all
    else
      @projects = Project.where(user_id: current_user)
    end
  end

  def new
    @project = Project.new
    @users = User.pluck(:username, :id)
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      @users = User.pluck(:username, :id)
      render :new
    end
  end

  def edit
    @users = User.all.select(:username, :id)
  end

  def update
    @project.update(project_params)
    redirect_to projects_path
  end

  def show
    @headline = 'Show'
    @comment = Comment.new(project: @project)
    # validation schreiben
    # @user = begin
    #     User.find(@project.user_id)
    #   rescue ActiveRecord::RecordNotFound
    #     false
    #   end
  end

  def destroy
    @project.destroy

    redirect_to projects_path
  end


  private

  def fetch_project_from_params
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :user_id)
  end

  def redirect_unless_authorized
    owner_id = @project.user_id
    redirect_to login_path unless owner_id == current_user.id || current_user.admin?
  end

end