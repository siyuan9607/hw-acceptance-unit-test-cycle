class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.same_director(id)
      target = self.find(id)
      if target.director == nil? or target.director.blank?
           return [nil,true]
      else
           movies = self.where(:director => target.director)
           return [movies,false]
      end
  end
end
