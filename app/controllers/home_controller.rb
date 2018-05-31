require 'httparty'
class HomeController < ApplicationController
  before_action :load_generes

  def index
  	movies_results = JSON.parse(Tmdb::Movie.now_playing.to_json)
  	@movies = movies_results.present? ? movies_results["table"]["results"] : []
    # {"table"=>{"vote_count"=>1451, "id"=>383498, "video"=>false, "vote_average"=>7.9, "title"=>"Deadpool 2", "popularity"=>491.010595, "poster_path"=>"/to0spRl1CMDvyUbOnbb4fTk3VAd.jpg", "original_language"=>"en", "original_title"=>"Deadpool 2", "genre_ids"=>[28, 35, 878], "backdrop_path"=>"/3P52oz9HPQWxcwHOwxtyrVV1LKi.jpg", "adult"=>false, "overview"=>"Wisecracking mercenary Deadpool battles the evil and powerful Cable and other bad guys to save a boy's life.", "release_date"=>"2018-05-15"}}
  	if params[:sort]
  		case params[:sort]
	  		when 'title'
	  			@movies = @movies.sort_by{|m| m["table"]["title"]}
				when 'date'
          @movies = @movies.sort_by{|m| Date.parse(m["table"]["release_date"])}
				when 'genre'
          @movies = @movies.sort_by{|m| helpers.generes_names(@generes, m["table"]["genre_ids"][0])}
			end
		end
    @recent_reviews = Review.order(created_at: :desc).limit(4)
  end

  def load_generes
    response = HTTParty.get("https://api.themoviedb.org/3/genre/movie/list?api_key=321f0d55186803c7ea63efc6b882b220&language=en-US")
    @generes = JSON.parse(response.to_json)["genres"]
  end
end
