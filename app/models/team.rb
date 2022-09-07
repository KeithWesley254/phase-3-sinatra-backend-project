class Team < ActiveRecord::Base
    has_many :players
    belongs_to :game
    belongs_to :kenya_esport_league
end