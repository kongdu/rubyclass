require 'sinatra'
require 'sinatra/reloader'
require 'csv'
require 'date'
require 'nokogiri'
require 'httparty'
require 'uri'
require 'rest-client'
require 'json'

get '/' do
  send_file 'index.html'
end

get '/index' do
  erb :index
end

get '/select' do
  erb :select
end

get '/b_result' do
  @blood = params[:b_result]
  erb :b_result
end

get '/webtoon' do
  url = "http://m.comic.naver.com/webtoon/weekday.nhn#"
  url = URI.encode(url)
  response = HTTParty.get(url)
  doc = Nokogiri::HTML(response)
  @title = doc.css("#pageList > li:nth-child(1) > div > a > div > h4 > span.toon_name > strong > span")
  @writer = doc.css("#pageList > li:nth-child(1) > div > a > div > p")
  @rank = doc.css("#pageList > li:nth-child(1) > div > a > div > div > span.txt_score")
  erb :webtoon
end
