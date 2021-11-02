#!/usr/bin/env ruby



class Jarvis

  def initialize
    @greetings = [
      "Hello Sir",
      "How are you doing this evening sir?",
      "How's your day going sir?",
    ]
  end

  def greeting
    return @greetings.sample
  end

  def reply(prompt)
    return case prompt
    when /^hi|hello/i
      greeting
    when /how much/i
      "Beer is 5 gold and mutton is 10 gold."
    when /need/i
      "I've got what you need, supplies for the journey. Torches, swords, guns and shoes."
    when /buy.*gun/i
      "A gun costs 500 gold"
    when /buy.*torch/i
      "A torch costs 20 gold"
    when /buy.*chicken/i
      "chicken is 5 gold a piece"
    when /buy.*(duck|geese)/i
      "we don't have birds, try the farmer down the road"
    when /weather/i
      "It looks like rain!"
    when /thank you/i
      "you're welcome"
    when /how (about|are) you/i
      "I'm doing great, thanks for asking"
    when /welcome/i
      "totally"
    when /what are we going to do|what should we do/i
      "maybe we can design your own suit, sir?"
    when /plan/i
      "maybe we can have some visitors over"
    when /invite/i
      "maybe we can invite some friends, sir"
    when /great/i
      "that's fantastic!"
    when /awesome|cool/i
      "when do you want to start designing your own suit sir?"
    when /later/i
      "what time sir?"
    when /how about (\d+:\d+|\d+)/i
      "yes, #{$1} sounds great. I'll make plans"
    else
      "I didn't hear you"
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
