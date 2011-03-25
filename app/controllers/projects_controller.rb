class ProjectsController < ApplicationController
  
  def index
    @project = Project.all
  end
  
  def new
    @project = Project.new(params[:id])
  end
  
  def create
    @project = Project.new(params[:id])
    
    if @project.save?
      flash.now[:success] = "Project Created"
    else
      redirect_to 'new'
    end  
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:success] = "Project Updated"
    else
      redirect_to 'edit'
    end 
  end
  
  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:success] = "Project Deleted"
    else
      flash[:error] = "Can't do that Starfox"
      redirect_to 'project_url'
    end
  end
  
end
