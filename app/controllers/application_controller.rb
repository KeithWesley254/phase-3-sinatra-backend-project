class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # GET REQUESTS
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/games" do
    all_games = Game.all
    all_games.to_json(only: [:id, :title, :genre, :platform, :description])
  end

  get "/games/teams" do
    all_games = Game.all
    all_games.to_json(only: [:id, :title, :genre, :platform, :description], 
      include: {teams: {only: [:id, :name, :team_owner, :founded, :description]}})
  end

  get "/games/players" do
    all_games = Game.all
    all_games.to_json(only: [:id, :title, :genre, :platform, :description], 
      include: {players: {only: [:id, :name, :age, :slogan, :role_played, :image_url]}})
  end

  get "/games/:id" do
    specific_game = Game.find(params[:id])
    specific_game.to_json(only: [:id, :title, :genre, :platform, :description], include: {teams: {only: [:id, :name, :description], include: {players: {only: [:id, :name, :role_played, :image_url, :slogan]}}}})
  end

  get "/games/:id/players" do
    specific_game = Game.find(params[:id])
    specific_game.to_json(only: [:id, :title, :genre, :platform, :description], include: {players: {only: [:id, :name, :role_played, :age, :image_url, :slogan]}})
  end

  get "/kenya_esport_league_table" do
    the_league = KenyaEsportLeague.all
    the_league.to_json(only: [:id, :league_name, :played, :won, :lost, :drawn, :points], 
      include: {teams: {only: [:id, :name, :team_owner, :founded, :description], 
        include: {players: {only: [:id, :name, :age, :slogan, :role_played, :image_url]}}}}
    )
  end

  get "/roles" do
    all_roles = Role.all
    all_roles.to_json(only: [:id, :role_name, :image_url, :description])
  end

  get "/players" do
    all_players = Player.all
    all_players.to_json(only: [:id, :name, :age, :slogan, :role_played, :image_url])
  end

  get "/players/stats" do
    all_players = Player.all
    all_players.to_json(only: [:id, :name, :age, :slogan, :role_played, :image_url], 
      include: {player_stats: {only: [:id, :number_of_games, :game_duration, :average_kills_per_game, :favourite_role]}})
  end

  get "/teams" do
    all_teams = Team.all
    all_teams.to_json(only: [:id, :name, :team_owner, :founded, :description])
  end

  get "/teams/players" do
    all_teams = Team.all
    all_teams.to_json(only: [:id, :name, :team_owner, :founded, :description], 
      include: {players: {only: [:id, :name, :age, :slogan, :role_played, :image_url]}})
  end

end
