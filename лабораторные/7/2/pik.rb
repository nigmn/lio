# coding: utf-8

class Chislo_p
  attr_accessor :s
  def initialize(p)
    @p = p
  end
  def col
    @o = @p.to_s.length
  end 
  def output
    puts 'число: '+ @p.to_s
    puts 'количество цифр в чисе: ' + col.to_s
	return @o
  end
end

class Strok_p < Chislo_p
  attr_accessor :str
  def initialize(p,st)
    super p
    @st = st
  end
  def output
    super
	puts 'строка: ' + @st
    l = @st.chomp.length
    puts 'число букв в строке:' + l.to_s
	return l.to_i
  end	   
end 
