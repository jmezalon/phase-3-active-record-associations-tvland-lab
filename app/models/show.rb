require 'pry'
class Show < ActiveRecord::Base
    has_many :characters
    belongs_to :network

    has_many :actors, through: :characters

    def actors_list
        id = self.characters.map{|a|a.id}[0]
        Actor.find(id).full_name
    end
end