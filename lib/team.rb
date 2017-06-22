require 'nokogiri'
require 'open-uri'

module Team
  def self.fetch_team_members
    puts "Fetching members from www.startae.com/team"
    puts "It may take a while"
    doc = Nokogiri::HTML(open('http://www.startae.com/team'))
    doc.css('div.card__caption').each do |link|
      user = User.new
      user.name =  link.css("h2.card__title").text
      user.role =  link.css("h3.card__subtitle").text
      twitter =  link.css("a.card__link--twitter").map{ |archor| archor['href'] }
      user.twitter_account =  twitter.first.split('/').last unless twitter.first.nil?
      user.save
    end
  end
end
