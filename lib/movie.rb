require_relative '../config/environment.rb'

class Movie
    attr_accessor :title, :year, :genre, :rating, :plot, :runtime

    @@all = []

    def initialize(response)
        response.each do |attribute, value|
            self.send("#{attribute}=", value)
        end

        @@all << self
    end
end