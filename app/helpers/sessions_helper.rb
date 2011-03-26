module SessionsHelper

  def sign_in(doer)
    cookies.permanent.signed[:remember_token] = [doer.id, doer.salt]
    current_doer = doer
  end

  def current_doer=(doer)
    @current_doer = doer
  end

  def current_doer
    @current_doer ||= doer_from_remember_token
  end

  def signed_in?
    !current_doer.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_doer = nil
  end

  private

    def doer_from_remember_token
      Doer.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

  def current_doer?(doer)
    doer == current_doer
  end
    
  def authenticate
    deny_access unless signed_in?
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end
  
  def store_location
    session[:return_to] = request.fullpath
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  
  def clear_return_to
    session[:return_to] = nil
  end
end