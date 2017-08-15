class LandmarksController < ApplicationController

  get '/landmarks/new' do
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params["landmark"]["name"])
    @landmark.name.update(name: params["landmark"]["name"]) unless params["landmark"]["name"].nil?
    #binding.pry
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id]) 
  end
end
