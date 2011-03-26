class ProjectsController < ApplicationController
  before_filter :authenticate,   :only => [:create, :destroy]
  before_filter :authorized_doer, :only => :destroy
  
  # def index
  #  @project = Project.all
  # end
  # 
  # def new
  #   @project = Project.new(params[:id])
  # end
  
  def create
    @project = current_doer.projects.build(params[:project])
    if @project.save
      flash.now[:success] = "Project Created"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end  
  end
  
  # def show
  #   @project = Project.find(params[:id])
  # end
  # 
  # def edit
  #   @project = Project.find(params[:id])
  # end
  # 
  # def update
  #   @project = Project.find(params[:id])
  #   if @project.update_attributes(params[:project])
  #     flash[:success] = "Project Updated"
  #   else
  #     redirect_to 'edit'
  #   end 
  # end
  
  def destroy
    @project.destroy
    
    if @project.destroy
      flash[:success] = "Project Deleted"
    else
      flash[:error] = "Can't do that Starfox"
      redirect_back_or root_path
    end
  end
  
  private
  
    def authorized_doer
      @project = Project.find(params[:id])
      redirect_to root_path unless current_doer?(@project.doer)
    end
end
