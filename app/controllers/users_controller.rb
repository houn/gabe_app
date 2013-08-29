class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def show
  	@user = User.find(params[:id])
  end
  def create
  	@user = User.new(params[:user])
  	if @user.save
  		# Handles a successful save.
      sign_in @user
  		flash[:success] = "Welcome to Gabe's App!"
  		redirect_to @user
  	else
  		render 'new'
  	end  
  end
end
