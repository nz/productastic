class Product < ActiveRecord::Base
  
  searchable do
    text :name, stored: true
    text :description, stored: true
  end
  
  def self.search(query)
    solr_search do
      keywords query do
        highlight :name, :description
      end
    end
  end
  
end
