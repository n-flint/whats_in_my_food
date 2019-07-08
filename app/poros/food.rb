class Food
  attr_reader :ndbno,
              :name,
              :group,
              :ds,
              :manu

  def initialize(food_data)
    @ndbno = food_data['ndbno']
    @name = food_data['name']
    @group = food_data['group']
    @ds = food_data['ds']
    @manu = food_data['manu']
  end
end