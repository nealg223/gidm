class DoersController < ApplicationController
  attr_accessor :name, :email
  
  def new
    @doer = Doer.new
    @title = "Sign up"
  end
  
  def create
    @doer = Doer.new(params[:doer])
    if @doer.save
      flash[:success] = "You now have access to the get it done machine."
      redirect_to @doer
    else
      @title = "Sign up"
      render 'new'
    end
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
    @title = @doer.name
    @projects = @doer.projects
    @tasks = @doer.tasks
  end

end

# see active relation cheat sheet under chain methods and research api