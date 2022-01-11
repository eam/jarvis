#!/usr/bin/env ruby

require './common_personality.rb'

class Jarvis < CommonPersonality
  def reply(prompt)
    case
    when /greetings/
      "greetings"
    else
      super(prompt)
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
