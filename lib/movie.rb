require_relative '../config/environment.rb'

class Movie
    attr_accessor :title, :year, :genre, :rating, :plot, :runtime

    # @@all = []

    def initialize(response)
        response.each do |attribute, value|
            self.send("#{attribute}=", value)
        end

        # @@all << self
    end

    def self.genre
        @genre
    end

    def self.rating
        self.ratings
    end

    def self.plot
        self.plot
    end

    def self.year
        self.year
    end

    def self.runtime
        self.runtime
    end
end