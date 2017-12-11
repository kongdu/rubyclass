#1. text라는 폴더로 들어간다
Dir.chdir("text")

#2.폴더내의 파일명을 확인하고, 파일명을 수정한다
files = Dir.entries(Dir.pwd).reject{|i| i[0] == '.'}
files.each do |name|
  File.rename(name, name.gsub("new", "new_"))
  ## 원형 File.rename(oldname, newname)  newname안에는 .gsub("수정할단어", "수정형태")
end
