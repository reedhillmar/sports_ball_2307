require 'rspec'
require './lib/player'
require "./lib/team"

describe Team do
  let (:team) {Team.new("Dodgers", "Los Angeles")}

  describe "#initialize" do
    it "can be a team" do
      expect(team).to be_a Team
    end

    it "can have a location and name" do
      expect(team.location).to eq("Los Angeles")
      expect(team.name).to eq("Dodgers")
    end
  end

  describe "#player_count" do
    it "starts with no players as default" do
      expect(team.roster).to eq([])
      expect(team.player_count).to eq(0)
    end
  end

  describe "#add_player" do
    it "can add players to the team and count them" do
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)

      team.add_player(player_1)
      team.add_player(player_2)

      expect(team.roster).to eq([player_1, player_2])
      expect(team.player_count).to eq(2)
    end
  end

  describe "#long_term_players & #short_term_players" do
    it "can categorize players by contract length" do
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.long_term_players).to eq([player_1, player_3])
      expect(team.short_term_players).to eq([player_2, player_4])
    end
  end

  describe "#total_value" do
    it "can give the total cost of the team" do
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.total_value).to eq(85200000)
    end
  end

  describe "#details" do
    it "can give team details that include total value and player count" do
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.details).to eq({"total_value" => 85200000, "player_count" => 4})
    end
  end
end