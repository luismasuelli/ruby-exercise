#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optionparser'
require './lib/dice'

if ARGV.empty?
  puts("Usage: #{__FILE__} <dice...>\n  Where each entry in dice is " \
       'a single number or role-playing format expressions like 2d6')
  exit(2)
else
  Random.srand
  result = Dice.parse ARGV
  result[:details].each do |detail|
    values = detail[:values].join(', ')
    dice = detail[:count] == 1 ? 'die' : 'dice'
    puts "Throwing #{detail[:count]} #{dice} of #{detail[:sides]} sides: " + values
  end
  puts "Total: #{result[:total]}"
end
