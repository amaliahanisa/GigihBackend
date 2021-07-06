require_relative 'person'

jin = Hero.new("Jin Sakai", 100, 50)
puts jin
puts "\n"

khotun = Person.new("Khotun Khan", 500, 50)
puts khotun
puts "\n"

puts khotun.deflect?

loop do
    jin.attack(khotun)
    puts khotun
    puts "\n"
    break if khotun.die?

    khotun.attack(jin)
    puts jin
    puts "\n"
    break if jin.die?
end
