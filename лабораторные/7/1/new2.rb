# coding: utf-8
require 'E:\lab\7\1\dop6.rb'
st = ''
puts 'введите строчку'
st = gets
f = File.new('F.txt', 'w')
f.write(st)
f.close
puts 'количество слов с 5 буквами: ' + poi.to_s
