class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # GET endpoints
  get "/" do
    %{
      Kenyan Esports League Database
    }
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

  get "/roles" do
    all_roles = Role.all
    all_roles.to_json(only: [:id, :role_name, :image_url, :description])
  end

  get "/roles/:id" do
    all_roles = Role.find(params[:id])
    all_roles.to_json(only: [:id, :role_name, :image_url, :description])
  end

  get "/players" do
    all_players = Player.all
    all_players.to_json(only: [:id, :name, :age, :slogan, :role_played, :image_url, :team_id])
  end

  get "/players/:id" do
    all_players = Player.find(params[:id])
    all_players.to_json(only: [:id, :name, :age, :slogan, :role_played, :image_url, :team_id], 
      include: {player_stats: {only: [:id, :number_of_games, :game_duration, :average_kills_per_game, :favourite_role]}})
  end

  get "/players/stats" do
    all_players = Player.all
    all_players.to_json(only: [:id, :name, :age, :slogan, :role_played, :image_url], 
      include: {player_stats: {only: [:id, :number_of_games, :game_duration, :average_kills_per_game, :favourite_role]}})
  end

  get "/teams" do
    all_teams = Team.all
    all_teams.to_json(only: [:id, :name, :team_owner, :founded, :description, :game_id])
  end

  get "/teams/:id" do
    specific_team = Team.find(params[:id])
    specific_team.to_json(only: [:id, :name, :team_owner, :founded, :description, :game_id])
  end

  get "/teams/players" do
    all_teams = Team.all
    all_teams.to_json(only: [:id, :name, :team_owner, :founded, :description], 
      include: {players: {only: [:id, :name, :age, :slogan, :role_played, :image_url]}})
  end

  get "/stats" do
    all_stats = PlayerStat.all
    all_stats.to_json(only: [:id, :number_of_games, :game_duration, :average_kills_per_game, :favourite_role], 
      include: {player: {only: [:id, :name]}})
  end

  get "/stats/:id" do
    all_stats = PlayerStat.find(params[:id])
    all_stats.to_json(only: [:id, :number_of_games, :game_duration, :average_kills_per_game, :favourite_role], 
      include: {player: {only: [:id, :name]}})
  end

  #POST endpoints

  post "/teams" do
    post_team = Team.create(
      name: params[:name],
      team_owner: params[:team_owner],
      founded: params[:founded],
      description: params[:description],
      game_id: params[:game_id],
    )
    post_team.to_json
  end

  post "/players" do
    post_player = Player.create(
      name: params[:name],
      age: params[:age],
      slogan: params[:slogan],
      role_played: params[:role_played],
      image_url: params[:image_url],
      team_id: params[:team_id]
    )
    post_player.to_json
  end

  post "/stats" do
    send_stats = PlayerStat.create(
      number_of_games: params[:number_of_games],
      game_duration: params[:game_duration],
      average_kills_per_game: params[:average_kills_per_game],
      favourite_role: params[:favourite_role],
      player_id: params[:player_id]
    )
    send_stats.to_json
  end

  #DELETE endpoints

  delete '/teams/:id' do
    yeeted = Team.find(params[:id])
    yeeted.destroy
    yeeted.to_json
  end

  delete '/stats/:id' do
    yeeted = PlayerStat.find(params[:id])
    yeeted.destroy
    yeeted.to_json
  end

  delete '/players/:id' do
    yeeted = Player.find(params[:id])
    yeeted.destroy
    yeeted.to_json
  end

  #PUT endpoints
  put "/teams/:id" do
    fix_it = Team.find(params[:id])
    fix_it.update(
      name: params[:name],
      team_owner: params[:team_owner],
      founded: params[:founded],
      description: params[:description],
      game_id: params[:game_id]
    )
    fix_it.to_json
  end

  put "/players/:id" do
    fix_it = Player.find(params[:id])
    fix_it.update(
      name: params[:name],
      age: params[:age],
      slogan: params[:slogan],
      role_played: params[:role_played],
      image_url: params[:image_url],
      team_id: params[:team_id]
    )
    fix_it.to_json
  end

  #PATCH endpoints

  patch "/players/:id" do
    fix_it = Player.find(params[:id])
    fix_it.update(
      name: params[:name],
      age: params[:age],
      role_played: params[:role_played],
      team_id: params[:team_id]
    )
    fix_it.to_json
  end

  patch "/teams/:id" do
    fix_it = Team.find(params[:id])
    fix_it.update(
      name: params[:name],
      team_owner: params[:team_owner],
      description: params[:description],
      game_id: params[:game_id]
    )
    fix_it.to_json
  end

end
