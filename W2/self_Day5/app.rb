require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
require './model.rb'

set :bind, '0.0.0.0'

before do
  p params
end

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :content, Text
  property :created_at, DateTime
end

DataMapper.finalize
Post.auto_upgrade!

#게시글 다 보여주는 곳!!
get '/' do
   @posts = Post.all
   erb :index
end

get '/new' do
 erb :new
end

#CRUD - 'C' ; Create
get '/create' do
  @title = params[:title]
  @content = params[:content]
  Post.create(title: @title, content: @content)
  #erb :create
  redirect '/'
end

#CRUD - 'R' ; Read
get '/posts/:id' do
  @post = Post.get(params[:id])
  erb :posts
end
#CRUD - 'D' ; destroy
get '/destroy/:id' do
  post = Post.get(params[:id]).destroy
  redirect '/'
end

#CRUD - 'U' ;
#1. 사용자에게 form을 입력받는 창
get '/edit/:id' do
  @post = Post.get(params[:id])
  erb :edit
end
#2. 실제로 db에 저장
get '/update/:id' do
  post = Post.get(params[:id])
  post.update(:title => params[:title], :content => params[:content])
  redirect '/'
end

get '/welcome/:name' do
  @name = params[:name]
  erb :welcome
end
