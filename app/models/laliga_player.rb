class Laliga_Player < ActiveRecord::Base
    belongs_to :laliga_league
    belongs_to :laliga_team
end