class DoersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_doer, :only => [:edit, :update]
  before_filter :admin_doer,   :only => :destroy
    
  def index
    @title = "All doers"
    @doers = Doer.paginate(:page => params[:page])
  end
  
  def show
    @doer = Doer.find(params[:id])
    @title = @doer.name
    @projects = @doer.projects
    @tasks = @doer.tasks
  end
  
  def new
    @doer = Doer.new
    @title = "Sign up"
  end
  
  def create
    @doer = Doer.new(params[:doer])
    if @doer.save
      sign_in @doer
      flash[:success] = "You now have access to the get it done machine."
      redirect_to @doer
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit doer"
  end
  
  def update
    @doer = "Update doer"
    if @doer.update_attributes(params[:doer])
      flash[:success] = "Doer updated."
      redirect_to @doer
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def destroy
    Doer.find(params[:id]).destroy
    flash[:success] = "Doer destroyed."
    redirect_to doers_path
  end
  
  private
    
    def correct_doer
      @doer = Doer.find(params[:id])
      redirect_to(root_path) unless current_doer?(@doer)
    end
    
    def admin_doer
      redirect_to(root_path) unless current_doer.admin?
    end
end

# see active relation cheat sheet under chain methods and research api