require 'open-uri'
require 'nokogiri'
class Pony < ActiveRecord::Base
    
    def self.crawling #함수 지정
        url = 'https://www.youtube.com/channel/UCT-_4GqC-yLY1xtTHhwY0hA'
        doc = Nokogiri::HTML(open(url + '/videos'), nil, "UTF-8")
 
        title=doc.css("ul#channels-browse-content-grid .yt-lockup-title//a")
        title.each_with_index do |c, i|
            #puts "#{i+1}"#index방 번호를 출력
            Pony.create(title: c.attr('title')) #저장하기! #이것을 위해 ponny.rb를 만들어준것임, 즉 , model을 생성한 것임
        end
    end
end#우리가 유투브에서 가져온 url을 저장할 거야!

#이거 다 짜고 난 후 실행결과를 보려면 콘솔창에 들어가서(rails c) Pony.crawling을 치면 됨
