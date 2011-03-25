class SessionsController < ApplicationController
    
  def new
    @title = "Sign in"
  end


  def create
    doer = Doer.authenticate(params[:session][:email],
                             params[:session][:password])
    if doer.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in doer
      redirect_back_or doer 
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
