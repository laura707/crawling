#맨 상위폴더(루트)에서 newfile만들기 클릭하고 이름.rb 라는 이름으로 하나 만들어 줄 것
require 'open-uri'
require 'nokogiri'

url = 'https://www.youtube.com/channel/UCT-_4GqC-yLY1xtTHhwY0hA'
doc = Nokogiri::HTML(open(url + '/videos'), nil, "UTF-8")
#pony의 채널 페이지에 videos에 해당하는 html파일을 가져올거야

#한글 깨지기 않기 위한 nil, "UTF-8"
#puts doc
#doc에는 url의 해당 html의 문서가 싹 다 들어가있다.
#crawling하려면 html구조를 파악해서 거기서 원하는 정보를 자기가 가져와야함
#뭐 가져올 지는 구글 검사기능 이용해서 해당 요소들이 무엇인지 파악할 것

title=doc.css("ul#channels-browse-content-grid .yt-lockup-title//a")
#ul태그의 id가 channels-browse-content-grid인 걸 가져올래!
#그리고 그 안에서 또 class가 yt-lockup-title인 걸루 가져올래 그리고 또 그 안의 a태그의 text를 가져올거야!!

title.each_with_index do |c, i|
    #puts "#{i+1}"#index방 번호를 출력
    puts c.attr('title')
end
#c에는 a태그가 들어가고 i는 index를 의미함
#인덱스의 방마다 다 출력하고 싶으면 문자열로! 문법에 따라 "#{i+1}"이라고 써주면 된다.
#c.attr('title')은 a태그의 속성인 title에 해당하는 값을 가져와 a태그가 있는 만큼, 즉, index방 개수만큼 돌려가며 출력

#ruby test.rb라고 배시창에 써주면 이 코드가 잘 작동하는지 알 수 있다.

