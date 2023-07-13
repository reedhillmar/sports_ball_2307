class Team
  attr_reader :name, :location, :roster

  def initialize(name, location)
    @name = name
    @location = location
    @roster = []
  end

  def player_count
    @roster.length
  end

  def add_player(player)
    @roster << player
  end

  def long_term_players
    @long_term_players = []
    
    @roster.each {|player| @long_term_players << player if player.contract_length > 24}

    @long_term_players.sort_by {|player| player.contract_length}
  end

  def short_term_players
    @short_term_players = []
    
    @roster.each {|player| @short_term_players << player if player.contract_length <= 24}

    @short_term_players.sort_by {|player| player.contract_length}
  end

  def total_value
    @total_value = 0

    @roster.each {|player| @total_value = @total_value + player.total_cost}

    @total_value
  end

  def details
    @details = {"total_value" => total_value, "player_count" => player_count}
  end
end