class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])

    if @user.save
      flash[:notice] = "Thanks for signing up. Please login"
      redirect_to "/login"
    else
      render "new"
    end
    
  end
end
