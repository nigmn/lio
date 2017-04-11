# coding: utf-8

def poi
  f = File.open('F.txt', 'r')
  t = f.gets
  f.close
  m = t.split(' ')
  t = m.select { |i| i.length == 5 }.size
  return t
end
