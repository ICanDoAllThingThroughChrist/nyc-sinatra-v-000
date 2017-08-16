class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

   get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
   end

  post '/figures' do
     @figure = Figure.create(name: params["figure"]["name"])
     #to persist in existing title_ids, UNLESS title_ids.nil?
     @figure.update(title_ids: params["figure"]["title_ids"]) unless params["figure"]["title_ids"].nil?
     @figure.titles.create(name: params["title"]["name"]) unless params["title"]["name"].empty?
     #binding.pry
     @figure.update(landmark_ids: params["figure"]["landmark_ids"]) unless params["figure"]["landmark_ids"].nil?
     @figure.landmarks.create(name: params["landmark"]["name"]) unless params["landmark"]["name"].empty?
     #binding.pry
     @figure.save
     redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    #binding.pry
    @figure.update(name: params["figure"]["name"]) #unless params["figure"]["name"].empty? # checks to make sure the params figure name is not ""
    #binding.pry
    @figure.update(title_ids: params["figure"]["title_ids"]) unless params["figure"]["title_ids"].nil?
    #here we create a new title with #id 3
    @figure.titles.create(name: params["title"]["name"]) unless params["title"]["name"].empty?
    @figure.update(landmark_ids: params["figure"]["landmark_ids"]) unless params["figure"]["landmark_ids"].nil?
    @figure.landmarks.create(name: params["landmark"]["name"]) unless params["landmark"]["name"].empty?
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  delete '/figures/:id/delete' do #delete action
    @figure = Figure.find_by_id(params[:id])
    @figure.delete
    redirect to '/figures'
   end

end
