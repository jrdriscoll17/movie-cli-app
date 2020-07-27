class MovieData
    attr_accessor :title, :year

    def initialize(title, year = nil)
        @title = title
        @year = year if year
    end


    case input
    when "genre" then display_genre
    when "rating" then display_rating
    when "plot" then display_plot
    when "full title" then display_full_title
    when "year" then display_year
    when "runtime" then display_runtime
    end
end