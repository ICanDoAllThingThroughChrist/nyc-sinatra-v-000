class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params["landmark"]["name"])
    @landmark.name.update(name: params["landmark"]["name"]) unless params["landmark"]["name"].nil?

    binding.pry
  end

end
