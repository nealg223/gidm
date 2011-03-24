class DoersController < ApplicationController
  
  def new
    @doer = Doer.new
  end
  
  def create
    @doer = Doer.new(params[:doer])
  end
  
  def edit
    @doer = Doer.find(params[:id])
  end
  
  def update
    @doer = "Update doer"
    if @doer.update_attributes(params[:id])
      flash[:success] = "Doer updated."
      redirect_to @doer
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def show
    @doer = Doer.find(params[:id])
    @projects = @doer.projects
    @tasks = @doer.tasks
  end

end

# see active relation cheat sheet under chain methods and research api