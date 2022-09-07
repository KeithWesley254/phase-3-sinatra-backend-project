class Premier_Team < ActiveRecord::Base
    belongs_to :premier_league
    has_many :premier_players
end