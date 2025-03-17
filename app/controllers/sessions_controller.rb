class SessionsController < ApplicationController
  def new
    # Renders new.html.erb by default
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user && BCrypt::Password.new(@user["password"]) == params["password"]
      session["user_id"] = @user["id"]
      flash[:notice] = "Successfully logged in!"
      redirect_to "/places"
    else
      flash[:notice] = "Invalid email or password."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash[:notice] = "Logged out."
    redirect_to "/login"
  end
end

