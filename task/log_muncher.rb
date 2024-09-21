include Gem::Text

result = {}
count = 0

File.open("A:/Prog_s/Ruby/ruby24_task1/data/log.txt", "r") do |file|
  file.each_line do |line|
    match = /=> ([А-Яа-яA-Za-z\sё]+)$/.match(line)

    found = false
    result.keys.each do |key|
      if levenshtein_distance(key, match[1]) < 3
        result[key] += 1
        found = true
        break
      end
    end

    result[match[1]] = 1 unless found

  end
end

print(result.count)

