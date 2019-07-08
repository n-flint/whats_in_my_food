class UsdaService

  def initialize(query)
    @query = query
  end

  def result_count
    fetch_data['total']
  end

  def food_list
    fetch_data['item']
  end

  private

  def conn
    Faraday.new('https://api.nal.usda.gov/ndb/search/') do |f|
      f.params['api_key'] = ENV['USDA_API_KEY']
      f.params['q'] = "#{@query}"
      f.params['max'] = "10"
      f.adapter Faraday.default_adapter
    end
  end

  def fetch_data
    response = conn.get
    JSON.parse(response.body)['list']
  end
end