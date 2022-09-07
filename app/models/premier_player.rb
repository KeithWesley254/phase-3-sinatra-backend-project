class Premier_Player < ActiveRecord::Base
    belongs_to :premier_league
    belongs_to :premier_team
end