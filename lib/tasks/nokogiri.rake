require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'date'
require 'open-uri'
namespace :list do
desc "update the show database with the list"

  task :scrape_hn => :environment do

  	Article.destroy_all

	tech = Nokogiri::HTML(open("https://news.ycombinator.com/"))
	for i in 0..4 do
		# puts tech.css('td.title a')[i]["href"]
		# puts tech.css('td.title a')[i].text
		art = Article.create({:url => tech.css('td.title a')[i]["href"], :title => tech.css('td.title a')[i].text, :category => "technology"})
		# art1 = Article.create({url: "kjhjkdbkj", title:"kjsbfjhkbsdjhfbsdhj shjdfbj", category: "art"})
		# puts art.inspect
		# puts art.errors.inspect
	end

	science = Nokogiri::HTML(open("http://www.sciencedaily.com/"))
	for i in 0..4 do
 	art1 = Article.create({:url => "http://www.sciencedaily.com" + science.css('ul#heroes_hero_shorts a')[i]["href"], :title => science.css('ul#heroes_hero_shorts a')[i].text, :category => "science"})
	# puts science.css('div.nnicontent a')[i].text
	# puts "http://www.sciencedaily.com" + science.css('ul#heroes_hero_shorts a')[i]["href"]
	end

  	movies = Nokogiri::HTML(open("http://www.cinemablend.com/news.php"))
	for i in 0..4 do
 	art2 = Article.create({:url => "http://www.cinemablend.com" + movies.css('div.nnicontent a')[i]["href"], :title => movies.css('div.nnicontent a')[i].text, :category => "movies"})
	# puts movies.css('div.nnicontent a')[i].text

	end

	art = Nokogiri::HTML(open("http://www.huffingtonpost.com/news/art-news/"))
	for i in 0..4 do
 	art1 = Article.create({:url => art.css('div.entry_right h3 a')[i]["href"], :title => art.css('div.entry_right h3 a')[i].text, :category => "art"})
	# puts art.css('div.entry_right h3 a')[i].text
	end

	medicine = Nokogiri::HTML(open("http://www.sciencedaily.com/news/health_medicine/"))
	for i in 0..4 do
 	art1 = Article.create({:url => "http://www.sciencedaily.com/news/health_medicine/" + medicine.css('ul#featured_shorts a')[i]["href"], :title => medicine.css('ul#featured_shorts a')[i].text, :category => "medicine"})
	# puts science.css('div.nnicontent a')[i].text
	# puts "http://www.sciencedaily.com" + science.css('ul#heroes_hero_shorts a')[i]["href"]
	end

	# movies = Nokogiri::HTML(open("http://www.cinemablend.com/news.php"))
	# for i in 0..5 do
 # 	art1 = Article.create({:url => "http://www.cinemablend.com" + movies.css('div.nnicontent a')[i]["href"], :title => movies.css('div.nnicontent a')[i].text, :category => "movies"})
	# # puts movies.css('div.nnicontent a')[i].text

	# end

  end

end

