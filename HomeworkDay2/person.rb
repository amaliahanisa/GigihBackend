#superclass
class Person
    attr_reader :name, :hitpoint, :attack_damage
    # biar bisa diakses oleh objek person lain
    # kaya fungsi getter di java
    # kalau attribut writer itu ibarat setter

    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
    end

    def to_s
        "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage"
    end

    def attack(other_person)
        puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
        other_person.take_damage(@attack_damage)
    end

    def take_damage(damage)
        @hitpoint -= damage
    end

    def die?
        if @hitpoint <= 0
            puts "#{@name} dies"
            true
        end
    end
 end

