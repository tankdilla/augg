class TrendsController < ApplicationController
  def index
    if params[:news_source].nil?
      news_source = "reddit"
    else
      news_source = params[:news_source]
    end
    
    if params[:topic_source].nil?
      topic_source = "googletrends"
    else
      topic_source = params[:topic_source]
    end
    
    @doc = Source.get_chicago_trends_json_doc
    
  end
  
  def search
    
  end

end