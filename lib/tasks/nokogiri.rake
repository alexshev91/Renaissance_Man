require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'date'
require 'open-uri'
namespace :list do
desc "update the show database with the list"

  task :scrape_hn => :environment do


	page = Nokogiri::HTML(open("https://news.ycombinator.com/"))  
	for i in 0..5 do
		puts page.css('td.title a')[i]["href"]
		puts page.css('td.title a')[i].text
		art = Article.create({:url => page.css('td.title a')[i]["href"], :title => page.css('td.title a')[i].text, :category => "technology"})
		# art1 = Article.create({url: "kjhjkdbkj", title:"kjsbfjhkbsdjhfbsdhj shjdfbj", category: "art"})
		puts art.inspect
		puts art.errors.inspect
	end


  

  end

end
