class Laliga_Team < ActiveRecord::Base
    belongs_to :laliga_league
    has_many :laliga_players
end