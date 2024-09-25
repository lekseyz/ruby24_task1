include Gem::Text

def dist(str1, str2)
  return false if (str1.length - str2.length).abs > 4
  return true if levenshtein_distance(str1, str2) < 5
  false
end

names = {}
count = 0


t1 = Time.now
File.open("A:/Prog_s/Ruby/ruby24_task1/data/log.txt", "r") do |file|
  file.each_line do |line|
    name = line[line.index('>')+1...line.length-1]

    names[name] = 0 if names[name].nil?
    names[name] += 1

  end
end

wrongs = names.sort_by{|_,nums|-nums}.to_a.drop(200)
puts("sorted")
wrongs.each { |name, _| names.delete(name) }
puts("deleted")

wrongs.each do |name,_|
  names.keys.each do |nameCor, _|
    if dist(name, nameCor)
      names[nameCor] += 1
      next
    end
  end
end

names.each do |name,count|
  puts "#{count} #{name}"
end
t2 = Time.now

puts "Время работы программы: "+(t2-t1).to_s+" cек"