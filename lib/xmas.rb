require 'open-uri'
require 'nokogiri'

# STEP2: Define a list method which does the list action
def list(gift_list)
  # print the number of gift in the list
  # STEP2: Print a message if there is nothing in the gift list
  if gift_list.length == 0
    puts "There are no gift in the list"
  elsif gift_list.length == 1
    puts "There is 1 element in the list."
  else
    puts "There are #{gift_list.length} elements in the list"
  end
  # STEP2: Iterate over the gift list array
  gift_list.each_with_index do |gift, index|
    # STEP2: Print every item inside
    # STEP5: Update the print to show the status and the name of the gift
    puts "#{index + 1}- [#{gift[:mark] ? "X" : " "}] #{gift[:name]}"
  end
end

# STEP3: Define a 'add' method
def add(gift_list)
  # STEP3: Ask the user what he wants to add
  puts "What do you want to add to your giftlist?"
  # STEP3: Get the answer into a variable
  answer = gets.chomp
  # STEP3: Print a message if he enters nothing
  if answer == ""
    puts "Invalid gift to add. Try again!"
  else
    # STEP3: Add this element to the gift list if it's not empty
    # STEP5: Update the argument so we push an hash
    gift_list.push({name: answer, mark: false})
    # STEP3: Print a message to say it's been added successfully
    puts "#{answer} has been added to your giftlist!"
  end
  list(gift_list)
end

# STEP4: Implement a delete method
def delete(gift_list)
  # STEP4: Display the giftlist (with index)
  list(gift_list)
  # STEP4: Ask the user which index he wants to delete
  puts "Which item you want to remove? (give number)"
  # STEP4: Store the answer in a variable
  answer = gets.chomp.to_i
  # STEP4: If the answer is in the gift_list
  # STEP5: Update the condition and the definition of 'element' so it works for an hash
  if gift_list.map{|gift| gift[:name]}.include?(gift_list[answer - 1][:name])
    element = gift_list[answer - 1][:name]
    # STEP4: Delete the answer from the gift_list
    gift_list.delete_at(answer - 1)
    # STEP4: Tell the user his answer got deleted
    puts "#{element} was deleted!"
  # STEP4: else
  else
    # STEP4: Tell the user it fails
    puts "Your choice is invalid. Try again!"
  end
end

def mark(gift_list)
  # STEP5: Ask the user which item he bought (index)
  puts "Which item did you buy?"
  # STEP5: Get the answer from the user
  answer = gets.chomp.to_i - 1
  # STEP5: Update the giftlist to put mark as true for this element
  gift_list[answer][:mark] = true
end

def idea(gift_list)
  # Ask for the idea to look for on Etsy
  puts "What are you looking for on Etsy?"
  # Get the answer into a variable
  idea = gets.chomp
  # Get the url to scrape
  url = "https://www.etsy.com/fr/search?q=#{idea}"
  file = open(url).read
  doc = Nokogiri::HTML(file)
  # Take the first 5 results
  results = doc.search('.v2-listing-card__info h3').first(5).map do |result|
    result.text.strip
  end
  # Display them
  results.each_with_index do |result, index|
    puts "#{index + 1}. #{result}"
  end
  # Ask for the one to add
  puts "Pick one to add to your list (give number"
  # get the answer
  answer = gets.chomp
  if answer == ""
    puts "Invalid gift to add. Try again!"
  else
    # STEP3: Add this element to the gift list if it's not empty
    gift_list << {name: results[answer.to_i - 1], mark: false}
    # STEP3: Print a message to say it's been added successfully
    puts "#{results[answer.to_i - 1]} has been added to your giftlist!"
  end
end
