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
end