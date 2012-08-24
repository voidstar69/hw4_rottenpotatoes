require 'spec_helper'
describe MoviesController do
  render_views

  describe "GET index" do
    it "tests the index page" do
      get :index
    end
  end

  describe "GET create" do
    it "tests the create page" do
      get :create
    end
  end
  
      #response.should contain "Foobar"
            
      #put :edit
      
      #get :destroy

      #put :update
            
      #get :match_director
      
      #true
      
      #def MoviesController.parameters
      #  return 1
      #end
      
      #movie = MoviesController.new()
      #movie.params[:id] = 3
      #post :show
      #get :create
      #movie.edit
      #movie.update
      #movie.destroy
      #movie.match_director
      #movie.index
    #end
  #end

  #describe "GET index" do
  #  it "finds movies with the same director as this movie" do
  #    true
  #  end
  #end
end