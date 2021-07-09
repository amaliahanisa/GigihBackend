require_relative 'person'

# Person that can deflect an attack
class Hero < Person

    def initialize(name, hitpoint, attack_damage, healpoint)
        super(name, hitpoint, attack_damage)
        @healpoint = healpoint
    end

    def take_damage(damage)
        if deflect?
            puts "#{@name} deflects the attack"
        else
            @hitpoint -= damage
        end
    end

    def deflect?
        case rand(100) + 1
          when  1..80   then true
          when 81..100   then false
        end
    end

    def heal(other_person)
        puts "#{@name} heals #{other_person.name}, restoring #{@healpoint}"
        other_person.get_healed(@healpoint)
    end

end