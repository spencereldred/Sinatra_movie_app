require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'

get '/' do
# redirect to form to get movie

  @method = "get"
  @action   = "/movie"

  erb :form
end

get '/movie' do

request = Typhoeus.get(
  "http://www.omdbapi.com",
  :params => { :s => params[:query] }
  )

  @movies = JSON.parse(request.body)["Search"]

  erb :index
end

get "/movie/:id" do
  # show a particular movie
  @id = params[:captures][0]

  request = Typhoeus.get(
    "http://www.omdbapi.com",
    :params => { :i => @id }
    )

  @movie_info = JSON.parse(request.body)
  #raise @movie_info.inspect

  erb :movie_view
end