class Site < ActiveRecord::Base
  attr_accessible :description, :parse_code, :search_string, :url
end
