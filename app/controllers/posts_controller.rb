class PostsController < ApplicationController
    before_action :load_user
    before_action :authenticate_user!,
    only: [:new, :edit, :update, :destroy]

    def index
        @posts = Post.all.order('created_at DESC')
    end

    def new
        @post = Post.new
    end

    def create 
        @post = @user.posts.create(get_params)
        puts(@post)
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
