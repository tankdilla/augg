require 'open-uri'

class Source
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  class << self
    def get_chicago_trends_json_doc
      site_hash = get_site("twitter trends chicago")
	    doc = JSON.parse(open("#{site_hash[:site]}#{site_hash[:search_string]}").read)
	    doc.first
	  end
	  
    def available_sources
      sites.collect{|site| site[:name]}
    end
    
    def query(site, topic)
  	  site_hash = get_site(site)
  	  
  	  string = topic[:name].gsub(" ", "+")
  	  result = get_result(site_hash, string)
  	  doc = JSON.parse(result) #doc is a hash, sweet. easier than scraping w/nokogiri
  	  parse_json_doc(doc, topic)
  	end
  	
  	def get_result(site_hash, string)
	    open("#{site_hash[:site]}#{site_hash[:search_string]}#{string}").read
  	end
    
  	def query_json(string)
  	  doc = JSON.parse(open("#{site}#{search_string}#{string}")) #doc is a hash, sweet. easier than scraping w/nokogiri
  	end
  	
  	def get_site(site)
  	  sites.each do |s|
        return s if s[:name] == site
  	  end
  	  
  	  []
  	end
  	
    def sites
  	  [
  	    {:name=>"reddit", :site => "http://www.reddit.com/", :search_string => "search.json?q="},
  	    {:name=>"twitter search", :site => "http://search.twitter.com/", :search_string => "search.json?q="},
  	    
  	    {:name=>"twitter trends chicago", :site => "http://api.twitter.com/", :search_string => "1/trends/2379574.json"},
  	    {:name=>"twitter trends daily", :site => "http://api.twitter.com/", :search_string => "1/trends/daily.json"},
  	    
      ]
      #Chicago WOEID from twitter:
      # [{"country"=>"United States", "name"=>"Chicago", "countryCode"=>"US", "placeType"=>{"name"=>"Town", "code"=>7}, 
      #     "parentid"=>23424977, "woeid"=>2379574, "url"=>"http://where.yahooapis.com/v1/place/2379574"}]
  	end
    
  	def parse_json_doc(doc, topic)
  	  results = Array.new
  	  
  	  case topic[:name]
        when "reddit"
          doc["data"]["children"].each do |element|
            results << {:link => element["data"]["url"], :title => element["data"]["title"]}
          end
        when "twitter search"
          doc["results"].each do |result|
            results << {:user => result["from_user"], :text => result["text"]}
          end
        when "twitter trends chicago"
          results << doc["results"]
        end
      
      topic[:results] = results
  	end
	
  end
end