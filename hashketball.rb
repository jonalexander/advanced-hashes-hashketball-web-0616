require 'Pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end #game_hash
    
def players
  # return a list of the players -- array of players
  players = game_hash[:home][:players] + game_hash[:away][:players]
end

def player(name)
  # returns the first hash of player data if :player_name matches the name parameter
  player = players.find { |player| player[:player_name] == name }
end
# player method notes
  # player("Alan Anderson")
  # =>  {:player_name=>"Alan Anderson", :number=>0, :shoe=>16, :points=>22, :rebounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1}
  # player("Alan Anderson")[:shoe] => 16

  # players = array containing all player hashes
  # find will search through the hashes and compare each :player_name with #name
  # find will return the entire player hash wherubn it finds a match
  # now you can treat player("Alan Anderson") as Alan Anderson's entire hash of stats

def teams
  game_hash.values
end

def team(team_name)
  # team should return ALL the information for the given input team
  team = teams.find { |team| team[:team_name] == team_name}
end


#=================


def num_points_scored(name)
  # collect the stat hash for the player
    # call player method
  player(name)[:points]
  # collect the number of points scored within the player's stat hash hash

  ##### Jeff's code from lecture #####
  # player = player(name)
  # player[:points]
end


def shoe_size(name)
  player(name)[:shoe]
  ##### Jeff's code from lecture #####
  # player = player(name)
  # player[:shoe]
end

def team_colors(team_name)
  team = team(team_name)
  team[:colors]
end

def team_names
  game_hash.collect { |location, data_hash| data_hash[:team_name] }
end


def player_numbers(team_name)
#find matching team_name
  #collect data hash for said team
    #add :numbers to array
  team = team(team_name)
  team[:players].each_with_object([]) do |hash, number_array|
    number_array << hash[:number]
  end
end

#### "Alan Anderson"

def player_stats(name)
  # returns correct hash but has an extra key that won't pass test
  # remove :player_name
  player(name).delete_if do |key|
    key == :player_name
  end
end


def big_shoe_rebounds
  # find player w/ biggest shoe size
  # returns the number of rebounds of the player
  player = players.max_by {|player| player[:shoe]}
  player[:rebounds]
end


### BONUS

def most_points_scored
  player = players.max_by {|player| player[:points]}
  player[:player_name]
end


def winning_team
  home_team = teams[0]
  away_team = teams[1]

  home_team_score = home_team[:players].inject(0) do |sum, player|
    sum += player[:points]
  end

  away_team_score = away_team[:players].inject(0) do |sum, player|
    sum += player[:points]
  end

  home_team_score > away_team_score ? home_team[:team_name] : away_team[:team_name]

end

# Old Code
  # scores = []
  # game_hash.collect do |location, data_hash|
  #   total_points = data_hash[:players]
  #   data_hash[:total_points] = (data_hash[:players].collect { |player, player_hash| player_hash[:points] }.inject { |sum, x| sum + x })
  #   scores.push(data_hash[:team_name], data_hash[:total_points])
  # end
  # scores[1] > scores[3] ? scores[0] : scores[2]


def player_with_longest_name
  # find player with longest name using max_by
  # return name
  player = players.max_by { |player| player[:player_name].length }
  player[:player_name]
end

# Old Code
  # longest_name_hash = nil

  # game_hash.each do |location, data_hash|
  #   data_hash[:players].each do |player, player_hash|
  #     longest_name_hash ||= player_hash
  #     longest_name_hash = player_hash if player_hash[:name].size > longest_name_hash[:name].size
  #   end
  # end

  # return longest_name_hash[:name]

def long_name_steals_a_ton?
  # find player with longest name
  # find player with most steals
  # are they the same? if so return true
  player_with_most_steals = players.max_by { |player| player[:steals]}
  player_with_longest_name == player_with_most_steals[:player_name] ? true : false
end

