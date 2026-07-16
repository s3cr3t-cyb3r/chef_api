class Recipe < ApplicationRecord
    def ingredients_list
        ingredients.split(", ")
    end

    def directions_list
        directions.split(", ")
    end

    def friendly_prep_time
        hours = prep_time / 60
        minutes = prep_time % 60
        result = ""
        result += "#{hours} hours " if hours > 0
        result += "#{minutes} minutes " if minutes > 0
        result
    end

    # Done with help
    def chef_name
        parts = chef.split(" ")
        chef_name = "#{parts.last}, #{parts.first}"
        chef_name
    end
    validates :chef, presence: true
    validates :directions, presence: true
    validates :ingredients, presence: true
    validates :name, presence: true
    validates :prep_time, presence: true
    validates :name, uniqueness: true
    validates :directions, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end