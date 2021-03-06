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
    #binding.pry
    @landmark.update(name: params["landmark"]["name"]) unless params["landmark"]["name"].nil?
    #@landmark.name.update(name: params["landmark"]["name"]) unless params["landmark"]["name"].nil?
    #@landmark.name.returned a string
    #binding.pry
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    #binding.pry
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    #binding.pry
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end
