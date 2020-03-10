require 'rails_helper'

describe MoviesController, :type => :controller do
    describe 'Search movies by the same director' do
    it 'should call the model for Movie.same_director' do
      Movie.should_receive(:same_director).with("1")
      get :find_same_director, {:id => 1}
    end
    it 'should go to right template if the director exists' do
      Movie.stub(:same_director).and_return(nil,true)
      get :find_same_director, {:id => 1}
      response.should render_template('find_same_director')
    end
    it 'should find out the right movie and assign it to the right template' do
       fake = double('movie')
       Movie.stub(:same_director).and_return(fake,true)
       get :find_same_director, {:id => 1}
       assigns(:movies).should == fake
    end
    it 'should return to movie index page if the director does not exist' do
       Movie.stub(:same_director).and_return([nil,true])
       get :find_same_director, {:id => 100}
       response.should redirect_to(movies_path)
    end
    it 'should have a flash notice if the director does not exist' do
       Movie.stub(:same_director).and_return([nil,true])
       get :find_same_director, {:id => 100}
       flash[:notice].should eq("this movie does not include a movie director.")
    end
end

end