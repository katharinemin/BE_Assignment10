class UsersController < ApplicationController

	 def index
	 	@users = User.all
	 end

	 def edit
	 	@user = User.find(params[:id])
	 end

	 def new
	 	@user = User.new
	 end

	 def update
	 	user = User.find(params[:id])
		user.fname = params[:user][:fname]
		if user.save
			flash[:notice] = "User Edited!"
		else
			flash[:alert] = "Oh, no!"
		end
		redirect_to users_path
	 end

	 def create
	 	user = User.new
		user.fname = params[:user][:fname]
		if user.save
			flash[:notice] = "User Created!"
		else
			flash[:alert] = "Oh, no!"
		end
		redirect_to users_path
	 end

	 def destroy
	 	user = User.find(params[:id])
	 	if user.destroy
	 		flash[:notice] = "User Deleted!"
	 	else
	 		flash[:alert] = "Oh, no!"
	 	end
	 	redirect_to users_path
	 end

end