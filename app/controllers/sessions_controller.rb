class SessionsController < ApplicationController
  def new
    # Render the login form
  end

  # def create
  #   user = User.find_by(email: params[:email])

  #   if user&.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to root_path, notice: 'Logged in successfully.'
  #   else
  #     flash.now[:alert] = 'Invalid email or password.'
  #     render :new
  #   end
  # end

  def create
    # Retrieve email and password from login form params
    email = params[:email]
    password = params[:password]

    # Authenticate the user using the class method
    user = User.authenticate_with_credentials(email, password)

    if user
      # If user exists and password is correct, log the user in
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in successfully!'
    else
      # If authentication fails, show an error message and render the login form
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end
  

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  

end
