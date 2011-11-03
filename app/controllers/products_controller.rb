class ProductsController < ApplicationController
  
  def index
    @search = Product.search(params[:q])
    @products = Product.scoped

    # Process the ugly facet array into a hash of {term: freq}, sorted by term.
    # TODO: Contribute the following back to Sunspot.

    @facets = Hash[*@search.facet_response["facet_fields"]["text"]]
    @facet_count_min = @facets.values.min
    @facet_count_max = @facets.values.max
    @facets = @facets.sort_by{|term, freq| term }
  end
  
end
