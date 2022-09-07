class Premier_League < ActiveRecord::Base
    has_many :premier_teams
    has_many :premier_players, through: :premier_teams
end