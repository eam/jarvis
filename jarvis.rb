#!/usr/bin/env ruby

require './common_personality.rb'

class Jarvis < CommonPersonality

end

j = Jarvis.new

puts j.greeting
loop {
  prompt = gets
  response = j.reply(prompt)
  puts response
}
