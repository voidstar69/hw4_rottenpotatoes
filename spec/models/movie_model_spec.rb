require 'spec_helper'

describe Movie, "#find by director" do
  it "finds movies with the same director as this movie" do
    movie = Movie.new :director => 'George Lucas'
    #movie.director.should == 'George Lucas'
    similar = movie.find_movies_with_same_director
    
    #foo = Movie.where(:director => 'George Lucas')
    #foo.count.should be 17

    #similar.count.should be 20
    similar.select do |m|
      m.director.should be 'George Lucas'
    end
  end
end