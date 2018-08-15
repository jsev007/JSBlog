class SessionsController < ApplicationController

  def new
  
  end
  
  def create

    user = User.find_by(email: params[:session][:email].downcase)
  
    if user && user.authenticate(params[:session][:password])
  
      session[:user_id] = user.id
      respond_to do |format|
        format.html { redirect_to user_path(user), notice: 'You have successfully logged in.' }
        format.json { head :no_content }
        #redirect_to root_path
      end
  
    else
      respond_to do |format|
        format.html { redirect_to login_path, notice: 'There was something wrong with your login information.' }
        format.json { head :no_content }
        #redirect_to root_path
      end
    end
  
  end
  
  def destroy
  
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'You have logged out.' }
      format.json { head :no_content }
      #redirect_to root_path
    end
  end
  
end