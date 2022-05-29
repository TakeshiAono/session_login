class BlogsController < ApplicationController
  # protect_from_forgery
  def index
    @blog = Blog.all
    
  end

  def new
    @blog = Blog.new

  end

  def create
    @blog = current_user.blogs.build(get_params)
    @blog.save
    byebug
    redirect_to blogs_path
  end

  def confirm
    # @blog = Blog.new(get_params)
    # @blog.user_id = current_user.id
    @blog = current_user.blogs.build(get_params)
    render :new if @blog.invalid?
  end

  def show
  end

  def destroy
    set_blog
    @blog.destroy
    redirect_to blogs_path
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def get_params
    params.require(:blog).permit(:title, :content )
  end

end
