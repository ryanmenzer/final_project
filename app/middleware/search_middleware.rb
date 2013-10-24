class SearchMiddleware

  def initialize(app)
    @app = app
  end

  def call(env)
    if env["PATH_INFO"] == "/search"
      request = Rack::Request.new(env)

      searchparams = { "attributes" => "url,tablename", "attributesToHighlight" => "full_name,email,title" ,  "hitsPerPage" => 5}

      results = Tenant.current_tenant.search(request.params["query"], searchparams)

      [200, {"Content-Type" => "applcation/json"}, results.to_json]
    else
      @app.call(env)
    end
  end
end
