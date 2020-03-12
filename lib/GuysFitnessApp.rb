require_relative "GuysFitnessApp/version"
require_relative "login"
require_relative "user_data"
require "tty-prompt"

$prompt = TTY::Prompt.new

def main_menu()
  system 'clear'
  while true
    input = $prompt.select("What would you like to do?") do |menu|
      menu.choice name: "Workout options",  value: 1
      menu.choice name: "Exercise option", value: 2
      menu.choice name: "Pair with slack",  value: 3
      menu.choice name: "Exit program", value: "exit"
    end
    
    case input
    when 1
      puts "wip"
    when 2
      exercise_menu()
    when 3
      puts "wip"
    when "exit"
      system 'clear'
      puts "Thanks for using my program"
      exit
    else
    system 'clear'
    puts "invalid input"
    end
  end
end

# def workout_menu()
#   puts
#   input = $prompt.select("What would you like to do?") do |menu|
#     menu.choice name: "View Workouts",  value: 1
#     menu.choice name: "", value: 2
#     menu.choice name: "Pair with slack",  value: 3
#     menu.choice name: "Exit option", value: "exit"
#   end
# end

def exercise_menu()
  system 'clear'
  while true
    input = $prompt.select("What would you like to do?") do |menu|
      menu.choice name: "View exercises",  value: 1
      menu.choice name: "Record new exercise", value: 2
      menu.choice name: "Remove an exercise",  value: 3
      menu.choice name: "Exit menu", value: "exit"
    end

    case input
    when 1
      pp $user_data.display()
    when 2
      $user_data.record
    when 3
      $user_data.delete
    when "exit"
      break
    else
    system 'clear'
    puts "invalid input"
    end
  end
end
# def slack_menu()
#   input = $prompt.select("What would you like to do?") do |menu|
#     menu.choice name: "Workout options",  value: 1
#     menu.choice name: "Exercise option", value: 2
#     menu.choice name: "Pair with slack",  value: 3
#     menu.choice name: "Exit program", value: "exit"
#   end
# end

system 'clear'

user = Login.new()

puts "Logged in as #{user.username}"

$user_data = User_Data.new(user.loginid)


while true 
  main_menu()
end