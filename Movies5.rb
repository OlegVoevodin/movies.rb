puts "введите имя файла" 
filename = gets # получаем имя файла 
filename = filename.chomp 
unless File.exist?(filename) 
  puts "File not found: #{filename}" 
  exit 
end 
require 'csv'
require 'date'

movie_list = Movielist.new(filename)
# первая часть задания. сортировка по длительности фильма 
puts "Часть 1. Самые продолжительные фильмы:"
puts " "
movie_list.sort_long_films.each{ |i,y| puts "#{i}"  + " ===> " + "#{y}"+ " мин"}
puts " "

# вторая часть задания сортировка комедий по дате выхода 
puts "Часть 2. Комедии отсортированные по дате выхода:"
puts " "
movie_list.sort_by_comedy.each{ |i,y| puts "#{i}"  + " ===> " + "#{y}"}
puts " "

# третья часть задания. Список режисеров по алфавиту 
puts "Часть 3. Список режисеров по алфавиту:"
puts " "
movie_list.sort_producer.each{ |i| puts i }
puts " "

# четвертая часть. колличество фильмов снятых не в США 
puts "Часть 4. Количество фильмов снятых не в США:"
puts movie_list.sort_counrty
puts " "

# бонусная часть 1 сколько фильмов снял режисер 
puts "Бонусная часть 1. Сколько фильмов снял режисер:"
puts " "
puts "режисер" + "               количество фильмов"
puts " "
movie_list.producer_stat
puts " "

# бонусная часть 2 в скольких фильмах участвовал актер 
puts "Бонусная часть 2. В скольких фильмах участвовал актер:"
puts " "
puts "актер" + "               количество фильмов"
puts " "
movie_list.actor_stat.each { |actor, num|  puts actor.chomp + "   " + "#{num}" }
puts " "

# использование date
puts "Бонусная часть 3. Статистика по месяцам"
puts " "
puts "месяц" + "  количество фильмов"
puts " "
movie_list.month_stat.each{ |month, list| puts month + " ==> " + "#{list.size}"}

#filmsclean=films.reject { |row| row.date.size == 4 }.each { |row| if row.date.
#  size == 7 then row.date << "-01" end }
#filmsclean.map { |date| date.date }.sort_by { |i| i[5..7] }.
#  map { |date| Date.strptime(date).strftime("%B") }.group_by { |month| month }.
#  each{ |month, list| puts month + " => " + "#{list.size}"}
