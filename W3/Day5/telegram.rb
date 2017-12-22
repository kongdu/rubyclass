require 'rest-client'
require 'uri'
require 'nokogiri'
require 'json'

# 기본 url
url = "https://api.telegram.org/bot"
# token을 통해서 우리의 chatbot을 확인하고,
token = "412930110:AAFP7I7pOI6PTUWV3Tcm7YNWA7EOVSKl2-M"
# getUpdates method활용
get_id_url = "#{url}#{token}/getUpdates"
# get요청을 보냄
# 응답은 json형식으로 넘어온다

#ruby의 hash data type으로 변경
response = RestClient.get(get_id_url)
puts response.body
hash = JSON.parse(response)
puts hash.class
## id를 가져온다
chat_id= hash["result"][0]["message"]["from"]["id"]
# RestClient get("http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=785")
# lotto_hash = JSON.parse(res_lotto)
# lotto_result = []
# 6.times do |i|
#   lotto_result << lotto_hash["drwtNo#{i+1}"]
# end
#
# (1..45).to_a.sample(6)


chat_id = "410941197"
# msg = lotto_result
 msg = "환영쓰!!"

msg_url ="#{url}#{token}/sendMessage?chat_id=#{chat_id}&text=#{msg}"
puts msg_url
RestClient.get(URI.encode(msg_url))
