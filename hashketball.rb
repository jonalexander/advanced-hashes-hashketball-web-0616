require 'Pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {

        "Alan Anderson" => {
          :name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },  

        "Reggie Evans" => {
          :name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },

        "Brook Lopez" => {
          :name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },

        "Mason Plumlee" => {
          :name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
          }, 

        "Jason Terry" => {
          :name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11, 
          :slam_dunks => 1
          } 
      } #:players
    }, #:home

    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players =>{

        "Jeff Adrien" => {
          :name => "Jeff Adrien", 
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
          },

        "Bismak Biyombo" => {
          :name => "Bismak Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
          }, 

        "DeSagna Diop" => {
          :name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
          },

        "Ben Gordon" => {
          :name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
          },

        "Brendan Haywood" => {
          :name => "Brendan Haywood",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
          }
      } #:players
    } #:away
  }
end
  
def num_points_scored(player_name)
  game_hash.each do |location, data_hash|
    data_hash[:players].each do |player, player_hash|
      return player_hash[:points] if player_hash[:name] == player_name
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, data_hash|
    data_hash[:players].each do |player, player_hash|
      return player_hash[:shoe] if player_hash[:name] == player_name
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, data_hash|
    return data_hash[:colors] if data_hash[:team_name] == team_name
  end
end

def team_names
  game_hash.collect { |location, data_hash| data_hash[:team_name] }
end

# def player_numbers(team_name)
#   game_hash.each do |location, data_hash| 
#     if data_hash[:team_name] == team_name
#       return data_hash[:players].collect { |player, player_hash| player_hash[:number] } 
#     end
#   end
# end

def player_numbers(name)
  game_hash.each_with_object([]) do |(location, team_hash), numbers|
    if team_hash[:team_name] == name
      team_hash[:players].each do |player, player_hash|
        numbers << player_hash[:number]
      end
    end
  end
end


def player_stats(player_name)
  game_hash.each do |location, data_hash|
    data_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash.delete_if { |key, value| value == player_name}
      end
    end
  end
end


def big_shoe_rebounds
  biggest_shoe_size = 0
  rebounds = 0

  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:shoe] > biggest_shoe_size
        rebounds = player_hash[:rebounds]
        biggest_shoe_size = player_hash[:shoe]
      end
    end
  end

  rebounds
end


### BONUS

def most_points_scored
  #most_points_scored_hash = nil
  most_points_scored = 0
  person_most_points_scored = "a"

  game_hash.each do |location, data_hash|
    data_hash[:players].each do |player, player_hash|
      person_most_points_scored ||= player_hash[:name]

      if player_hash[:points] > most_points_scored
        person_most_points_scored = player_hash[:name]
        most_points_scored = player_hash[:points] 
      end
    end
  end

  person_most_points_scored
end


def winning_team
  scores = []

  game_hash.collect do |location, data_hash|

    total_points = data_hash[:players]

    data_hash[:total_points] = (data_hash[:players].collect { |player, player_hash| player_hash[:points] }.inject { |sum, x| sum + x })
    scores.push(data_hash[:team_name], data_hash[:total_points])
  end

  scores[1] > scores[3] ? scores[0] : scores[2]
end


def player_with_longest_name
  longest_name_hash = nil

  game_hash.each do |location, data_hash|
    data_hash[:players].each do |player, player_hash|
      longest_name_hash ||= player_hash
      longest_name_hash = player_hash if player_hash[:name].size > longest_name_hash[:name].size
    end
  end

  return longest_name_hash[:name]
end

def long_name_steals_a_ton?
  most_steals_hash = nil

  game_hash.each do |location, data_hash|
    data_hash[:players].each do |player, player_hash|
      most_steals_hash ||= player_hash
      most_steals_hash = player_hash if player_hash[:steals] > most_steals_hash[:steals]
    end
  end  

  most_steals_hash[:name] == player_with_longest_name ? true : false
end

