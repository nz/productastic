class Product < ActiveRecord::Base
  
  searchable do
    text :name, stored: true, default_boost: 10
    # text :name, as: 'name_text_en'
    text :description, stored: true
  end
  
  def self.search(query)
    solr_search do
      keywords query do
        highlight :name, :description
      end
      adjust_solr_params do |params|
        params[:facet] = true
        params[:'facet.field'] = 'name_texts'
      end
    end
  end
  
end
