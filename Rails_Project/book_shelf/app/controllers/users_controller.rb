class UsersController < ApplicationController
	def index
		@users = User.all

	# binding.pry
	end
	def create
		@users = User.new(user_params)
		@users.save
		redirect_to users_path
	end
	def destroy
	    User.find(params[:id]).destroy
	    flash[:success] = "User deleted"
	    redirect_to users_path
	    		# binding.pry
	end
	def update

		@user = User.find(params[:id])
		@user.update_attributes(user_params)
			# binding.pry
	      	redirect_to @user
		# Handle a successful update.
		
      		# render 'edit'
		
	      
				# User.find(params[:id]).update_attributes(user_params)
	end

	def edit
	    @user = User.find(params[:id])
	end

	def show
	    @user = User.find(params[:id])

		# @users = User.find(params[:id] )
		# @users.destroy
		redirect_to users_path
	end

	def user_params
		params.require(:user).permit(:name, :email,:birthday,:gender,:password,:user_name)
	end
end
