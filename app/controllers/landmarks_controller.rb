class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/edit'
  end

end
