require 'pry'
class Actor < ActiveRecord::Base
    has_many :characters

    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        show = self.shows.map{|a|a.name}.join
        character = self.characters.map{|a|a.name}.join
        character+' - '+show
    end
end