#0. filr.rb의 위치는 C:/Ruby

#1. text폴더로 들어간다
Dir.chdir("text")

#2. 파일을 만든다
20.times do |i|
  i += 1
#f= File.open("newfile.txt#{i}", "w+") do |file|
  File.open("newfile"+i.to_s+".txt", "w+") do |file|
    file.write("hello world")

  end
end

#3. 파일에 내용을 입력한다
