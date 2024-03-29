class UsersController < ApplicationController
  def show
    binding.pry
    @user = User.find(params[:id].to_i)
  end
  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])    # Not the final implementation!
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end
  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
