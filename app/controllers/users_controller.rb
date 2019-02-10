class UsersController < ApplicationController
    before_action :authenticate_user!,
    only: [:edit, :update, :destroy]

    def index
    end

    def new
        @user = User.new
    end

    def create 
        @user = User.create(get_params)
        if @user.valid?
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def update
    end

    def destroy
    end

    def get_params
        user_params = params.require(:user)
        user_params.permit(:last_name, :first_name, :birth_date)
    end
end
