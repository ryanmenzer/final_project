module SearchableTenant

  ##################################################################  Params can be changed : https://github.com/algolia/algoliasearch-rails#search-settings

  def search(query, params)
    Algolia.client.get(Algolia::Protocol.search_uri(self.subdomain, query, params))['hits']
  end

  # build_index people: [:full_name, :email], groups: [:name], initiative: [:title]  <- have to be arrays

  def build_index(params)
    index = Algolia::Index.new(self.subdomain)

    params.each do |tablename, getters|
      klass = Object.const_get(tablename.to_s.classify)

      klass.all.each do |record|
        object_params = {"tablename" => record.class.table_name,
                         "url" => "/#{self.class.table_name}/#{self.id}"}

        getters.each{|getter| object_params[getter.to_s] = record.send(getter)}

        index.add_object(object_params)
      end
    end
  end

end
