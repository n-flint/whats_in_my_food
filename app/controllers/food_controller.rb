class FoodController < ApplicationController

  def index
    render locals: {
      facade: UsdaFacade.new(params['q'])
    }
  end
end