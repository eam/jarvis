#!/usr/bin/env ruby

class Jarvis

  def initialize
    @greetings = [
      "Hello Sir",
      "How are you doing this evening sir?",
      "How's your day going sir?",
    ]
    @activities = [
      "creating Iron Man suits",
      "playing Q-Zar laser tag",
      "talking to friends online",
      "contacting the area 51 base",
      "baking a cake",
      "building the iron man suit " + random_suit,
      "creating the " + random_suit,
      "designing the new " + random_suit,
      "going to " + place,
      "playing with my " + thing,
    ]
  end

  def greeting
    return @greetings.sample
  end

  def random_suit
    File.readlines("iron_man_suits.txt").map(&:chomp).sample
  end

  def activity
    return @activities.sample
  end

  def place
    [
      "Rustwater",
      "McDonalds",
      "Disneyland",
      "Las Vegas",
      "Library",
      "Target",
      "China",
      "Red Lobster",
      "Great America",
      "Mountain Mike's",
      "Dave and Buster's",
      "Santa Cruz Beach Boardwalk",
      "Zoo",
    ].sample
  end

  def thing
    [
      "Arc Reactor",
      "Super advanced chainsaw",
      "Hot Link",
      "Paperclip",
      "Computers",
      "Google Sketchup",
      "bottle of soy sauce",
      "Google Home",
      "Jimmy Neutron Boy Genius DVD",
      "Apple TV",
      "Bag of Tortilla chips",
      "BBQ Grill",
      "Video camera",
      "Framed pictures",
      "toys",
    ].sample
  end

  def verb
    [
      "mowing",
      "studying",
      "typing",
      "designing",
      "practicing",
      "reading",
      "watching",
      "eating",
      "playing",
      "caring",
      "loving",
    ].sample
  end

  def adjective
    [
      "sticky",
      "gooey",
      "crunchy",
      "friendly",
      "sour",
      "rough",
      "spicy",
      "gentle",
      "grumpy",
    ].sample
  end

  def times
    [
      "three o'clock",
      "right now",
      "tomorrow",
      "on my birthday",
      "on christmas",
      "in just a second",
      "in a minute",
    ].sample
  end

  def change_subject
    [
      "How about those " + thing + ", I hear it's very " + adjective,
      "How about we meet up " + times,
      "Have you ever been to " + place + "?",
      "I hear " + place + " is " + adjective + " to visit " + times,
    ].sample
  end

  def reply(prompt)
    return case prompt
    when /^hi|hello/i
      greeting
    when /buy.*(duck|geese)/i
      "we don't have birds, try the farmer down the road"
    when /weather/i
      "It looks like rain!"
    when /thank you/i
      "you're welcome"
    when /how (about|are) you/i
      "I'm doing great, thanks for asking"
    when /(going|doing) good/i
      "that's great, I'm so happy for you. Shall we get started on " + activity
    when /welcome/i
      "totally"
    when /what are we going to do|what should we do/i
      activity
    when /plan/i
      "maybe we can have some visitors over"
    when /invite/i
      "maybe we can invite some friends, sir"
    when /great/i
      "that's " + adjective + "!"
    when /awesome|cool/i
      "I know, right?"
    when /later/i
      "what time sir?"
    when /how about (\d+:\d+|\d+)/i
      "yes, #{$1} sounds great. I'll make plans"
    when /iron man suit/i
      "What kind of iron man suit do you have in mind for me?"
    when /going fine|pretty well/
      "Good to hear"
    when /what .* doing/
      activity
    when / eat /
      "I like to eat " + adjective + " food like they serve at " + place
    when /when/
      "Let's do " + activity + " at " + times
    else
      change_subject
    end
  end
end

j = Jarvis.new

puts j.greeting
loop {
  prompt = gets
  response = j.reply(prompt)
  puts response
}
