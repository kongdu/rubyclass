require 'sinatra'
#http://localhost:4567

get '/' do
  send_file 'index.html'
end
#http://localhost:4567/welcome
get '/welcome' do
  send_file 'welcome.html'
end
#url에 :name을 쓰면 params[:name]으로 받을 수 있다.
#ex) /welcome/hodu params[:name] == "hodu"
get '/squre/:name' do
  # @name이라고 하면, erb에서 불러올 수 있다.
  @name = params[:name]
  erb :welcome
end

get '/6' do
  #erb는 views 폴더에서 가져온다
  erb :hello
end

get '/lotto' do
  @lotto=(1..45).to_a.sample(6)
  erb :lotto
end

get '/google' do
  erb :google
end

get '/search' do
  @q = params[:q]
  @name = params[:name]
  erb :search
end

get '/lunch' do
  @lunch = ["멀캠20층", "순남시래기", "시골집"].sample
  @img_url = {
    "멀캠20층" => "https://scontent-sea1-1.cdninstagram.com/t51.2885-15/s480x480/e35/20482590_499699500374813_6269244207261548544_n.jpg?ig_cache_key=MTU3Mzk4NTcyODI5NDQ1NDk5OQ%3D%3D.2",
    "순남시래기" =>"http://cfile25.uf.tistory.com/image/235FF03455A3421504721F",
    "시골집" => "https://scontent.cdninstagram.com/t51.2885-15/s320x320/sh0.08/e35/14099392_661079487402979_1222276838_n.jpg"
  }
  erb:lunch
end

get '/fortune' do
  @year = ["2017","2018","2019","2020"].sample
  @zodiac = ["황소","양","물고기","물병","염소","사수","전갈","천칭","처녀","사자","게","쌍둥이"].sample
  @color = ["빨강","파랑","흰","검정"].sample
  @img={
    "황소" =>"http://5io0615vq7k4e1k1l12k8b3r.wpengine.netdna-cdn.com/wp-content/uploads/2013/04/animal-green-taurus.png",
    "양"=>"http://5io0615vq7k4e1k1l12k8b3r.wpengine.netdna-cdn.com/wp-content/uploads/2013/04/animal-pink-aries.png",
    "물고기"=>"http://www.astrology-zodiac-signs.com/images/pisces.jpg",
    "물병"=>"http://5io0615vq7k4e1k1l12k8b3r.wpengine.netdna-cdn.com/wp-content/uploads/2013/04/animal-orange-aquarius.png",
    "염소"=>"http://www.astrology-zodiac-signs.com/images/capricorn.jpg",
    "사수"=>"http://www.astrology-zodiac-signs.com/images/sagittarius.jpg",
    "전갈"=>"http://www.astrology-zodiac-signs.com/images/scorpio.jpg",
    "천칭"=>"http://5io0615vq7k4e1k1l12k8b3r.wpengine.netdna-cdn.com/wp-content/uploads/2013/04/animal-orange-libra.png",
    "처녀"=>"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUZFnrcqv1EXRtSf-ld0U90DJFknimMk_tGB-9tWOR2wk29Y-G",
    "사자"=>"http://5io0615vq7k4e1k1l12k8b3r.wpengine.netdna-cdn.com/wp-content/uploads/2013/04/animal-pink-leo.png",
    "게"=>"http://5io0615vq7k4e1k1l12k8b3r.wpengine.netdna-cdn.com/wp-content/uploads/2013/04/animal-blue-cancer1.png",
    "쌍둥이" =>"http://5io0615vq7k4e1k1l12k8b3r.wpengine.netdna-cdn.com/wp-content/uploads/2013/04/animal-orange-gemini.png"
  }
  erb:fortune
end
