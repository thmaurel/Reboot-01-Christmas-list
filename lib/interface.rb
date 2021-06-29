# STEP2: require the file with the methods
require_relative 'xmas'

# TODO: you can build your christmas list program here!

# Print a welcome message
puts "Welcome to your Christmas gift list"
# Loop until the answer is 'quit'
answer = nil
# STEP2: Initialize the gift list
# gift_list = ['phone', 'status']
# STEP5:
gift_list = [{ name: 'phone', mark: true }, { name: 'computer', mark: false }]
# gift_list = {'phone' => true, 'computer' => false}


until answer == 'quit'
  # Ask the user what he wants to do (list, add ,delete, quit)
  # STEP5: Add the mark action
  puts 'Which action [list|add|delete|mark|idea|quit]?'
  # Get the answer of the user and store it
  answer = gets.chomp
  case answer
  # If the answer is list
  when 'list'
    # print 'TODO: list items'
    # puts 'TODO: list items'
    # STEP2: Refactor everything in a gift method and call it here
    list(gift_list)
  # elsif the answer is add
  when 'add'
    # STEP3: Refactor everything into a add method and call it here
    add(gift_list)
  # elsif the answer is delete
  when 'delete'
    # STEP4: Refactor everything into a delete method
    delete(gift_list)
  # STEP5: elsif the answer is mark
  when 'mark'
    # STEP5: Refactor everything into a mark method
    mark(gift_list)
  # elsif the answer is idea
  when 'idea'
    idea(gift_list)
  # elsif the answer is quit
  when 'quit'
    # print 'Goodbye'
    puts 'Goodbye!'
  # else
  else
    # print a message saying wrong action try [list|add|delete|quit]
    puts 'Wrong action, try [list|add|delete|quit]!'
  end
end
