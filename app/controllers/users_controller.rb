class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	# @hacks = Hack.where(:user_id => @user.id)
  	@hacks = @user.hacks
  end
end
