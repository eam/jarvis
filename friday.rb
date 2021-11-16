#!/usr/bin/env ruby

require './common_personality.rb'

class Friday < CommonPersonality

  def reply(prompt)
    return case prompt
    when /hello/
      "greetings good sir"
    when /what.*plans.*today/
      "we should build and design a random iron man suit"
    when /what do you mean/
      "Well, what I mean by that is the " + thing + " is very " + adjective + " when it's at the " + place 
    else
      super(prompt)
    end
  end
end

f = Friday.new

puts f.greeting
loop {
  prompt = gets
  response = f.reply(prompt)
  puts response
}
