class UsersController < ApplicationController
    def new
        @user = User.new
    end
      
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user), notice: "yeh!!!!"
        else
            redirect_to new_user_path, notice: "email already registered"
        end
    end
      
    def show
        @user = User.find(params[:id])
    end
      
    private
    def user_params
        params.require(:user).permit(:email)
    end
end
