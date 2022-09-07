class Laliga_League < ActiveRecord::Base
    has_many :laliga_teams
    has_many :laliga_players, through: :laliga_teams
end