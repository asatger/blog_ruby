class PostsController < ApplicationController
    before_action :load_post,
    only: [:edit, :show, :destroy]
    before_action :load_user
    before_action :authenticate_user!,
    only: [:new, :edit, :update, :destroy]

    def index
        @posts = Post.all.order('created_at DESC').page(params[:page]).per(4);
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

    def show
    end

    def edit
        if User.find(@post.user_id) != current_user
            redirect_to user_path(current_user)
        end
    end

    def update
        @post = @user.posts.update(params[:id], get_params)
        if @post.valid? 
            redirect_to user_path(current_user)
        else
            render 'new'
        end
    end

    def destroy
        if User.find(@post.user_id) == current_user
            @post = Post.destroy(params[:id])
        end
        redirect_to user_path(current_user)
    end

    def load_post
        @post = Post.find(params[:id])
    end

    def load_user
        @user = current_user
    end

    def get_params
        post_params = params.require(:post)
        post_params.permit(:title, :lead, :content, :image)
    end
end
