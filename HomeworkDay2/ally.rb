require_relative 'person'

# Person that can be healed
class Ally < Person
    def get_healed(healpoint)
        @hitpoint += healpoint
    end
end