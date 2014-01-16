require 'typhoeus'
require 'json'

###### Movie List JSON File #########
@query = "Star Wars"
movie_list_request = Typhoeus.get(
  "http://www.omdbapi.com",
  :params => { :s => @query }
  )
@movie_list = JSON.parse(movie_list_request.body)
@movie_list.each do |k,v|
  p "key is: #{k}"
  p "value is: #{v}"
end

######## Just the Movies
@movies = @movie_list.map do |k,v|
  v
end
@movies.flatten!

p @movies

@movies.each do |movie|
  p movie["Title"]
  p movie["imdbID"]
end


@id = "tt0076759"

movie_info_request = Typhoeus.get(
  "http://www.omdbapi.com",
  :params => { :i => @id }
  )

movie_info = JSON.parse(movie_info_request.body)

#puts movie_info