# coding: utf-8
require 'E:\lab\7\2\pik.rb'
s = 0
while s == 0
  puts 'введите число'
  s = gets.to_i
end
puts 'введите строку'
str = gets.to_s

chis = Chislo_p.new(s)
stro = Strok_p.new(s,str)
puts
puts 'элементы объекта число:'
chis.output
puts
puts 'элементы объекта строка:'
stro.output
