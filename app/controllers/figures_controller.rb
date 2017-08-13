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
    @figure = Figure.create(params["figure"])
    redirect "figures/#{@figure.id}"
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
