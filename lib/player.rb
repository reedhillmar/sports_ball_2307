class Player
  attr_reader :name, :monthly_cost, :contract_length, :nickname

  def initialize(name, monthly_cost, contract_length, nickname = nil)
    @name = name
    @monthly_cost = monthly_cost
    @contract_length = contract_length
    @nickname = nickname
  end

  def first_name
    @name.split.first
  end

  def last_name
    @name.split.last
  end

  def total_cost
    @monthly_cost * @contract_length
  end

  def set_nickname!(aka)
    @nickname = aka
  end
end