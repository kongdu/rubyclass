require 'sinatra'
require 'sinatra-reloader'
require 'csv'
require 'date'

get '/' do
  send_file "index.html"
end

get '/signup' do
  erb :signup
end

get '/complete' do
  @email = params[:email]
  @pwd = parmas[:pwd]
  @pwd = params[:pwd2]
  @time = Time.now.to_s
  
  #비밀번호 두개가 같으면 완료
  if @pwd == @pwd2
    CSV.open('user.csv', 'a+utf-8') do |csv|
      csv << [@email, @pwd]
    end
    #아니면 다시 회원가입 페이지로
    erb :complete
else
  redirect '/signup'
  end
end

get '/users' do
  @users =[]
  CSV.foreach('diary.csv', encoding: 'utf-8') do |row|
    @users << row
  end
end
