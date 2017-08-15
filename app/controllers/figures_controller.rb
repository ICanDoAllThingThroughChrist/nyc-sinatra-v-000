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

   get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
     @figure = Figure.create(name: params["figure"]["name"])
     @figure.save
     redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    if @figure.name != params["figure"]["name"]
      @figure.name = params["figure"]["name"]
    end
    @figure.landmarks.clear
    params["figure"]["landmark_ids"].each do |x| @figure.landmarks << Landmark.find_by_id(x) end
    if !Landmark.find_by_name(params["landmak"]["name"])#duplication avoided
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
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
