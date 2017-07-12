class UsersController < ApplicationController
	def index
		@users = User.all

	# binding.pry
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
	end
	def destroy
	    User.find(params[:id]).destroy
	    flash[:success] = "User deleted"
	    redirect_to users_path
	    		# binding.pry
	end
	def update

		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			# binding.pry
	      	redirect_to @user
		# Handle a successful update.
		else
      		render 'edit'
		end
	end

	def edit
	    @user = User.find(params[:id])
	end

	def show
	    @user = User.find(params[:id])
		# @users = User.find(params[:id] )
		# @users.destroy
	end

	def user_params
		params.require(:user).permit(:name, :email,:birthday,:gender,:password,:user_name,:image)
		# binding.pry
	end
end
