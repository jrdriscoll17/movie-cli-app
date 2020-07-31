class Movie
    attr_accessor :title, :year, :genre, :rating, :plot, :runtime
    @@all = []

    def initialize(response)
        response.each{|attribute, value| self.send("#{attribute}=", value)}
        @@all << self
    end

    def self.all
        @@all
    end
end