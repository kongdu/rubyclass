require 'sinatra'
require 'sinatra/reloader'
require 'csv'
require 'date'

before do
  p "**********************"
  p params
  p "**********************"
end

get '/' do
  send_file "index.html"
end

# /post 글 쓸 수 있는 곳
get '/post' do
#  @done = params[:done]
  erb :post
end

# /complete =>글 완료

get '/complete' do
  @title =params[:title]
  @content =params[:content]
  CSV.open('diary.csv','a+:utf-8') do |data|
    data << [@title, @content]
  end
  erb :complete
end

get '/diary' do
  @diary=[]
  CSV.foreach('diary.csv', encoding: 'utf-8') do |row|
    @diary << row
  end
  erb :diary
end

get '/signup' do
  erb :signup
end

get '/usercomplete' do
  @email = params[:email]
  @pwd = params[:pwd]
  @pwd2 = params[:pwd2]
  @time = Time.now.to_s
if @pwd == @pwd2
  CSV.open('user.csv', 'a+:utf-8') do |csv|
    csv << [@email, @pwd, @time]
  end
erb :usercomplete
else
  redirect '/signup'
  end
end

get '/users' do
  @users =[]
  CSV.foreach('user.csv', encoding:'utf-8') do |row|
    @users << row
  end
  erb :users
end
