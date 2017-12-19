class HomeController < ApplicationController
#컨트롤러는 액션의 모음이다.
#모델과 뷰 사이의 중간관리자이다.
#action
#app/views/컨트롤러이름/액션이름.html.erb
#app/views/home/index.html.erb
  def index
  end
#action
#app/views/home/lotto.html.erb
  def lotto
    @lotto = (1..45).to_a.sample(6).sort
  end

  def welcome
    @name = params[:name]
  end

  def square
    @num = params[:num]
  end

  def lunch
  @lunch = ["20층","유연카레","버거킹"].sample
  @img_url ={
    "20층" => "https://scontent-sea1-1.cdninstagram.com/t51.2885-15/s480x480/e35/20987024_1431422050287339_2004189507347283968_n.jpg?ig_cache_key=MTU4NzUwMTg2NjEwNzc3MTI0Nw%3D%3D.2",
    "유연카레" => "https://img.siksinhot.com/story/1503589689504884.jpg?w=307&h=300&c=Y",
    "버거킹" => "http://image.chosun.com/sitedata/image/201501/31/2015013100869_2.jpg"
  }
  end

  def google
  end

  def vote
  end

  def result
    @vote = params[:vote]
  end

  def game1 #폼만 보여주는 액션
  end

  def game1_result #결과를 보여주는 액션
    @name = params[:name]
    @god_answer = ["외계인", "도깨비", "사자", "꽃게"].sample
  end

  def game2

  end

end
