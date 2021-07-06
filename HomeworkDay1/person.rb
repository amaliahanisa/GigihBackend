#superclass
class Person
    attr_reader :name, :hitpoints, :attack_damage
    # biar bisa diakses oleh objek person lain
    # kaya fungsi getter di java
    # kalau attribut writer itu ibarat setter

    def initialize(name, hitpoints, attack_damage)
        @name = name
        @hitpoints = hitpoints
        @attack_damage = attack_damage
    end

    def to_s
        "#{@name} has #{@hitpoints} hitpoint and #{@attack_damage} attack damage"
    end

    def attack(other_person)
        puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
        other_person.take_damage(@attack_damage)
    end

    def take_damage(damage)
        @hitpoints -= damage
    end

    def die?
        if @hitpoints <= 0
            puts "#{@name} dies"
            true
        end
    end
 end

 #subclass
 class Hero < Person

    def take_damage(damage)
        if deflect?
            puts "#{@name} deflects the attack"
        else
            @hitpoints -= damage
        end
    end

    def deflect?
        case rand(100) + 1
          when  1..80   then true
          when 81..100   then false
        end
    end
end



