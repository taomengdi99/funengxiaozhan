class PostsController < ApplicationController
  def index
    if params[:category].blank?
      @posts = Post.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(:category_id => @category_id).order("created_at DESC")
    end
  end
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
    @categories = Category.all.map{|c| [c.name, c.id]}
  end
  def create
    @post = Post.new(post_params)
    @post.category_id = params[:category_id]
    @post.save
    redirect_to posts_path
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, alert:"消灭成功！"
  end
  private
  def post_params
    params.require(:post).permit(:content, :category)
  end
end
