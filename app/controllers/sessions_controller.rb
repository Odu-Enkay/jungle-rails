class SessionsController < ApplicationController
  
  def new
    
  end

  def create
   #user = User.find_by_email(params[:email])
   #If the user exist AND the password entered is correct.

   if user = User.authenticate_with_credentials(params[:email], params[:password])
    session[:user_id] = user.id
    redirect_to '/'
   else
    flash[:error] = 'Invalid email or password'
    render :new
   end 
  end
    

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
