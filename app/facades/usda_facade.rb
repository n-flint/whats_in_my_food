class UsdaFacade

  def initialize(query)
    @query = query
  end

  def total_results
    conn = Faraday.new('https://api.nal.usda.gov/ndb/search/') do |f|
      f.params['api_key'] = ENV['USDA_API_KEY']
      f.params['q'] = "#{@query}"
      f.params['max'] = "10"
      f.adapter Faraday.default_adapter
    end

    response = conn.get
    data = JSON.parse(response.body)
    data['list']['total']
  end

  
end
