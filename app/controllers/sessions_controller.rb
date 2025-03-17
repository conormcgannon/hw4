class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params ["email"]})
    if @user && BCrypt::Password.new(@user["password"])
      session["user_id"] = @user["id"]
      flash[:notice] = "Welcome back, #{@user["first_name"]}!"
      redirect_to "/places"
    else
      flash[:notice] = "Invalid email or password."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash[:notice] = "You have been logged out."
    redirect_to "/login"
  end
end
  