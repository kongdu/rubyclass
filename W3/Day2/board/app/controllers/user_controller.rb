class UserController < ApplicationController

  def new
  end

  def create
    @name=  params[:name]
    User.create(
    name: params[:name],
    email: params[:account],
    password: params[:pwd],
    )
  end

  def login
  end

  def login_process
    @user = User.find_by(email: params[:account])
    if @user.nil?
      flash[:alert] = "회원가입 해주세요"
      redirect_to '/user/new'
    else
      if @user.password == params[:pwd]
        session[:user_id] = @user.id
        flash[:notice] = "'#{@user.name}'님 로그인 성공했습니다"
        redirect_to '/'
      else
        flash[:false] = "비밀번호가 틀렸습니다"
        redirect_to :back
      end
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end


end
