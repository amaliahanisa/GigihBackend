require_relative 'person'
require_relative 'villain'
require_relative 'mongol'
require_relative 'hero'
require_relative 'ally'

jin = Hero.new("Jin Sakai", 100, 50, 60)
yuna = Ally.new("Yuna", 90, 45)
sensei = Ally.new("Sensei Ishikawa", 80, 60)
mongol_archer = MongolArcher.new("Mongol Archer", 80, 40)
mongol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60)
mongol_swordsman = MongolSwordsman.new("mongol Swordsman", 100, 50)
villains = [mongol_archer, mongol_spearman, mongol_swordsman]

# loop until jin dies or all villain dissapear (flee or die)
i = 1
until (jin.die? || villains.empty?) do
    puts "=========== Turn #{i} ============="
    puts "\n"

    # print all the identity
    puts jin
    puts yuna
    puts sensei

    villains.each do |villain|
        puts villain
    end
    puts "\n"

    puts "As Jin Sakai, what do you want to do this turn?
    1) Attack an enemy
    2) Heal an ally"

    number = gets.chomp.to_i
    if number == 1
        puts "Which enemy you want to attack?
        1) Mongol Archer
        2) Mongol Spearman
        3) Mongol Swordsman"

        enemy_num = gets.chomp.to_i
        if enemy_num == 1
            jin.attack(mongol_archer)
        elsif enemy_num == 2
            jin.attack(mongol_spearman)
        elsif enemy_num == 3
            jin.attack(mongol_swordsman)
        else
            puts "Invalid input"
        end
    elsif number == 2
        puts "Which ally you want to heal?
        1) Yuna
        2) Sensei Ishihara"

        ally_num = gets.chomp.to_i
        if ally_num == 1
            jin.heal(yuna)
        elsif ally_num == 2
            jin.heal(sensei)
        else
            puts "Invalid input"
        end
    else
        puts "Invalid input"
    end

    yuna.attack(villains[rand(villains.size)])
    sensei.attack(villains[rand(villains.size)])

    # the villain that got attacked, can flee , die, or damaged
    # villains.each do |villain|
    #     villains.delete(villain) if villain.die? || villain.flee?
    # end
    # puts "\n"

    # each villain attack jin
    villains.each do |villain|
        villain.attack(jin)
    end
    puts "\n"

    i += 1
end