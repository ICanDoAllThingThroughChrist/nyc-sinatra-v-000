class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.create(name: params["figure"]["name"])
    @figure.update(landmark_ids: params["figure"]["landmark_ids"]) unless params["figure"]["landmark_ids"].empty?
    @figure.landmarks.create(name: params["landmark"]["name"]) unless params["landmark"]["name"].empty?
    @figure.update(title_ids: params["figure"]["title_ids"]) unless params["figure"]["title_ids"].empty?
    @figure.titles.create(name: params["title"]["name"]) unless params["title"]["name"].empty?
    @figure.save
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    #binding.pry
    @figure.landmark = params[:landmark]
    @figure.title = params[:title]
  end

  delete '/figures/:id/delete' do #delete action
    @figure = Figure.find_by_id(params[:id])
    @figure.delete
  redirect to '/figures'
end
end
