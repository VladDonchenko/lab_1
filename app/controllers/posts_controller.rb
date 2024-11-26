class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize, only: %i[new edit destroy update]
  before_action :add_view, only: %i[index show]

  def add_view
    unless current_autor
      cookies[:views] = cookies[:views].present? ? cookies[:views].to_i + 1 : 1
      @show_register = cookies[:views].to_i % 5 == 0
    end
  end

  def index
    @posts = Post.search(params[:search])
    @posts = Post.search(params[:search]).paginate(page: params[:page], per_page: 8)
  end

  def show
    @post.increment(:views)
    @post.save
    # @comment_status = params[:comments_status].to_s.downcase

    #  @comments = if @comment_status == 'unpublished'
    #               @post.comments.unpublished
    #             else
    #               @post.comments.published
    #            end
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post = Post.new(post_params.merge(autor_id: current_autor.id))
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def set_autor_post
    @post = Post.where(autor_id: current_autor.id).find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :title, :content, :image, :main_image, :second_image, :img, :autor_id)
  end
end
