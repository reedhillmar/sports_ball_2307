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

  def average_cost_of_player
    @average_cost_of_player = total_value/player_count

    chars = @average_cost_of_player.to_s.length

    to_currency(@average_cost_of_player.to_s, chars)
  end

  def to_currency(string, chars)
    commas_to_add = chars/3 - 1

    commas_added = 0

    if commas_added != commas_to_add
      @string = string.insert(-4, ",")

      until commas_added == commas_to_add
        comma_index = @string.index(",")

        @string = @string.insert(comma_index - 3, ",")

        commas_added += 1
      end
    end

    @string.prepend("$")
  end

  def players_by_last_name
    @last_names = []

    @roster.each {|player| @last_names << player.last_name}

    @last_names.sort.join(", ")
  end
end