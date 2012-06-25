require 'simple-rss'
require 'open-uri'
require 'nokogiri'

class Feed < ActiveRecord::Base 
	
	def parse_rss
		#example usage
		rss = SimpleRSS.parse open(selected_feed)
		doc = Nokogiri::HTML(rss.entries.first.content)
		
		#sample of grabbing link and text from href
		doc.search('a')[0]['href']
		doc.search('a')[0].text
	end
	
	class << self
		def get_topics
			parse_topics_from_feed
		end
		
		def parse_topics_from_feed
			topics = []
			rss = SimpleRSS.parse open(selected_feed)
			doc = Nokogiri::HTML(rss.entries.first.content)
			
			doc.search('a').each do |line|
				topics << {:name => line.text}
			end
			
			topics
		end
		
		def selected_feed
			"http://www.google.com/trends/hottrends/atom/hourly"
		end
		
		def parse_content(doc, site)
		  entries = Array.new
		  case site
		  when "reddit"
		    doc.search("p.title").each do |element|
	        element.search("a").each do |node|
	          entries << {:text=>node.text, :link=>node['href']}
	        end
		    end
		  end
		end
		
		def sites
		  [
		    {:site => "http://www.reddit.com/", :search_string => "search.json?q="},
		    {:site => "http://search.twitter.com/", :search_string => "search.json?q="}
	    ]
		end
		
	end
end
