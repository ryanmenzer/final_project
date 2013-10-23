class SearchController < ActionController::Base

  def search
    results = Tenant.current_tenant.search(params[:query])
    
    render json: results
  end

end
