class PagesController < ApplicationController
  
  def home
    @title = "Home"
    if signed_in?
      @project = Project.new if signed_in?
      @feed_items = current_doer.feed.paginate(:page => params[:page])
    end
  end
  
  def signup
    @title = "Signup"
  end
  
  def login
    @title = "Login"
  end
  
  # def projects
  #   @title = "Projects"
  # end
  # 
  # def task
  #   @title = "Get er done"
  # end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end

end
