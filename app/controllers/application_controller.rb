class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    puts "---- Running current_user ----"
    @current_user = User.find_by({ "id" => session["user_id"] })
    puts "Session user_id: #{session["user_id"]}"
    puts "Current user: #{@current_user.inspect}"
  end
  
end
