module Searchable

  # include Searchable
  #
  #  after_save do
  #    make_searchable :full_name, :email        <- as many fields as you like
  #  end
  #

  def make_searchable(*attrs)
    unless Rails.env.test?

    index = Algolia::Index.new(self.tenant.subdomain)
    object_params = {"id" => self.id,
                     "tablename" => self.class.table_name,
                      "url" => "/#{self.class.table_name}/#{self.id}"}

    attrs.each do |attribute|
      object_params[attribute.to_s] = self.send(attribute)
    end

      algolia = index.add_object(object_params)
      self.update_attributes(algolia_id: algolia["objectID"])

    end
  end

  def destroy_search
    unless Rails.env.test?

    index = Algolia::Index.new(self.tenant.subdomain)
    index.delete_object(self.algolia_id.to_s)

    end
  end

  def update_search(*attrs)

    unless Rails.env.test?

      index = Algolia::Index.new(self.tenant.subdomain)
      object_params = {"id" => self.id,
                       "tablename" => self.class.table_name,
                       "url" => "/#{self.class.table_name}/#{self.id}",
                       "objectID" => self.algolia_id.to_s}

      attrs.each do |attribute|
        object_params[attribute.to_s] = self.send(attribute)
      end

      algolia = index.save_object(object_params)

    end
  end

end


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

