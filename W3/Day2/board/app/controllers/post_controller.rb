class PostController < ApplicationController
before_action :authorize, except: [:index]
  def index
      @posts = Post.all.reverse #순서를 뒤바꾸고 싶을때 .reverse
  end

  def new #form에서 글쓰는 창이니까, 아무것도 없다
  end

  def create
    #    params[:username] params[:title] params[:content]
    #1번방법  (모델 쓸때는 반드시 대문자)
    Post.create(:username => params[:username], :title =>params[:title], :content=>params[:content])
    #2번방법
    # post = Post.new
    # post.username = params[:username]
    # post.title = params[:title]
    # post.content = params[:content]
    # post.save

     redirect_to '/'
  end


  def show  #어떤글을 보여주겠다 # @변수를 통해서 erb파일에서 보여준다
    @post = Post.find(params[:id])
    @comments = Comment.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(
      username: params[:username],
      title: params[:title],
      content: params[:content]
    )
    redirect_to "/post/show/#{params[:id]}"
  end
  def destroy
    # @id= params[:id]
    # post = Post.find(@id)
    # post.destroy
    Post.find(params[:id]).destroy
    redirect_to "/"
  end

  def add_comment
    Comment.create(
      content: params[:content],
      post_id: params[:id]
    )
    redirect_to :back
  end


end
