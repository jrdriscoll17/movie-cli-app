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

    #    response = API.get_response("batman")
    #    movie = Movie.new(response)
    #    binding.pry


    # def call

    # end

    def self.display_genre
        self.genre
    end

    def self.display_rating
        self.ratings
    end

    def self.display_plot
        self.plot
    end

    def self.display_year
        self.year
    end

    def self.display_runtime
        self.runtime
    end
end