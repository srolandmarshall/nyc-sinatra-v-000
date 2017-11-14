class FiguresController < ApplicationController

    get '/figures/new' do
      erb :'/figures/new'
    end

    get '/figures' do
      @figures = Figure.all
      erb :'/figures/index'
    end

    post '/figures' do
      @figure = Figure.create(params[:figure])
      @figure.titles << Title.create(params[:title]) if !params[:title].empty?
      @figure.landmarks << Landmark.create(params[:landmark]) if !params[:landmark].empty?
      @figure.save
      # binding.pry:
      redirect '/figures/'+@figure.id.to_s
    end

    get '/figures/:id' do
      @figure = Figure.find_by(id: params[:id])
      erb :'/figures/show'
    end

    post '/figures/:id' do
      @figure = Figure.find_by(id: params[:id])
      @figure.update(params[:figure])
      @figure.titles << Title.create(params[:title]) if !params[:title].empty?
      @figure.landmarks << Landmark.create(params[:landmark]) if !params[:landmark].empty?
      @figure.save
      erb :'/figures/show'
    end

    get '/figures/:id/edit' do
      @figure = Figure.find_by(id: params[:id])
      erb :'/figures/edit'
    end

end
