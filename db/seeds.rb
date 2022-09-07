puts "🌱 Seeding greatness..."

20.times do
    seeded_games = Game.create(
        title: Faker::Game.title,
        genre: Faker::Game.genre,
        platform: Faker::Game.platform,
        description: Faker::Lorem.paragraphs
    )
end

30.times do
    seeded_teams = Team.create(
        name: Faker::Esport.team,
        team_owner: Faker::Name.name_with_middle,
        founded: Faker::Date.between(from: '2014-09-23', to: '2020-09-25'),
        description: Faker::Lorem.paragraphs,
        game_id: rand(1..20),
        kenya_esport_league_id: 1
    )
    seeded_league = KenyaEsportLeague.create(
        league_name: Faker::Esport.league,
        played: rand(9..10),
        won: rand(0..10),
        lost: rand(0..10),
        drawn: rand(0..10),
        points: rand(0..30)
    )
end

300.times do
    seeded_players = Player.create(
        name: Faker::Esport.player,
        age: rand(13..19),
        slogan: Faker::Quotes::Shakespeare.hamlet_quote,
        role_played: ["Tank", "Dps", "Support", "Flank"].sample,
        image_url: Faker::Avatar.image,
        team_id: rand(1..30)
    )
    seeded_stats = PlayerStat.create(
        number_of_games: rand(20..50),
        game_duration: rand(30..60),
        average_kills_per_game: rand(10..40),
        favourite_role: ["Tank", "Dps", "Support", "Flank"].sample,
        player_id: seeded_players.id
    )
end

Role.create(role_name: "Tank", image_url: "https://p4.wallpaperbetter.com/wallpaper/239/625/228/mobile-legends-gatotkaca-mighty-legend-hd-wallpaper-preview.jpg", description: "Tank characters deliberately attract enemy attention and attacks (potentially by using game mechanics that force them to be targeted) to act as a decoy for teammates. Since this requires them to endure concentrated enemy attacks, they typically rely on a high health pool or support by friendly healers to survive while sacrificing their own damage output. Since they keep other members of a team alive, tanks often take on an unofficial leadership role: The tank acts as the de facto leader of the group by pulling and holding monsters' attention. It's up to me to set the pace as we clear the dungeon. But more than knowing how much the party can handle at once, I need to know where those monsters need to be positioned, what direction they should face, and what abilities they can use that might threaten the group. I'm also expected to stay on top of all the current meta strategies for beating a dungeon. When shortcuts are found that let players skip monsters, I need to know them")
Role.create(role_name: "Dps", image_url:"https://p4.wallpaperbetter.com/wallpaper/260/244/13/mobile-legends-lunox-cosmic-harmony-hd-wallpaper-preview.jpg", description: "Damage dealers, as the name implies, are players who are responsible for dealing damage in the group. It is almost always abbreviated as DPS (Damage per second) or DPSer in-game. All of the ten classes can play as DPS with the right spec in the right gear. Their importance should not be neglected because without reasonable DPS it may take a long time to kill the mobs. The difference between good DPS and bad DPS is most obviously seen in encounters where the mobs must be killed within a certain time for various reasons.")
Role.create(role_name: "Flank", image_url: "https://p4.wallpaperbetter.com/wallpaper/579/1/177/mobile-legends-chou-iori-yagami-hd-wallpaper-preview.jpg", description: "Did you ever see Jurassic Park, the original? When the guy meets the raptor head on, and then he's like 'they always hunt in packs' and then the one pokes its head out on his left out of nowhere and he says 'clever girl'. Yeah she's a flanker")
Role.create(role_name: "Support", image_url: "https://p4.wallpaperbetter.com/wallpaper/497/1014/538/mobile-legends-kadita-white-robin-hd-wallpaper-preview.jpg", description: "Support is a unique and highly demanding role in regard to the variety of assets that they are able to bring to their team. Whether it is crowd control or utility, experienced Support players will immediately contemplate carefully before choosing their champion by communicating with their team to recognize what composition they are pursuing. As a Support, it is critical to understand what champions are ideal and viable in comparison to others for each individual game. While crowd control is optimal, there needs to be sufficient damage. While initial burst is capable of winning a teamfight, there has to be utility to protect the carries. Although a sizable portion of the community believes that the major responsibilities of a Support ends at warding and assisting the ADC through the laning phase, the prowess of a Support player’s understanding of his or her Champion can be the final factor between winning and losing a match")

puts "✅ Done seeding!"
