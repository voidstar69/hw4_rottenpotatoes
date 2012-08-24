class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def find_movies_with_same_director
    Movie.where(:director => @director)
  end
  
  def director_path(movie_path, movies_path)
    if director == nil or director.empty?
      movies_path
    else
      return movie_path + "/match_director"
    end
  end
end
