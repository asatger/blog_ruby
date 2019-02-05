class PostsController < ApplicationController
    before_action :load_user

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create 
        @post = @user.posts.create(get_params)
        if @post.valid? 
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def update
    end

    def destroy
    end

    def load_user
        @user = current_user
    end

    def get_params
        post_params = params.require(:post)
        post_params.permit(:title, :lead, :content, :image)
    end
end
