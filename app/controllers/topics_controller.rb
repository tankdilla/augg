class TopicsController < ApplicationController
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
    
    @topics = Feed.get_topics
    #@topics = Topic.get_from(topic_source)
    @topics.each do |topic|
      topic[:source] = news_source
      Source.query(news_source, topic)
    end
  end

end
