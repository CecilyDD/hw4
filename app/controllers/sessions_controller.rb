# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to places_path, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully"
  end
end




def create
  user = User.find_by(email: params[:email])
  if user
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to places_path, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Authentication failed"
      render :new
    end
  else
    flash.now[:alert] = "User not found"
    render :new
  end
end



def create
  user = User.find_by(email: params[:email])
  puts "User: #{user.inspect}" # Debugging message
  if user
    if user.authenticate(params[:password])
      puts "Authentication successful" # Debugging message
      session[:user_id] = user.id
      redirect_to places_path, notice: "Logged in successfully"
    else
      puts "Authentication failed" # Debugging message
      flash.now[:alert] = "Authentication failed"
      render :new
    end
  else
    puts "User not found" # Debugging message
    flash.now[:alert] = "User not found"
    render :new
  end
end
