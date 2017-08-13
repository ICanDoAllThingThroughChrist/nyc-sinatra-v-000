class FiguresController < Sinatra::Base
  get '/figures/new' do
    erb :new
  end

  post '/figures' do
    binding.pry
    @figure = Figure.create(:name => params[:figure], :landmarks_id => params[:landmark], :title_id => params[:title])
  end
end
# form to create a new figure
#https://learn.co/tracks/full-stack-web-dev-with-react/
#sinatra/activerecord/sinatra-restful-routes
