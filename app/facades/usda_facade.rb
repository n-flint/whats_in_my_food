class UsdaFacade

  def initialize(query)
    @query = query
  end

  def total_results
    usda_service.result_count
  end

  def foods
    usda_service.food_list.map do |f|
      Food.new(f)
    end
  end

  private

  def usda_service
    UsdaService.new(@query)
  end
end
