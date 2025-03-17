class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @current_user = User.find_by({ "id" => session ["user_id"]})
    
    puts "------------------ Running current_user ------------------"
    puts "Session user_id: #{session["user_id"]}"
    puts "Current User: #{@current_user.inspect}"
    puts "------------------------------------"
  end
end
