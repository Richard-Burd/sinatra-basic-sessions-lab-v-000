require_relative 'config/environment'

class App < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "Barzalshatuach"
    set :sodz_biyoter, "maumzmah" # this can be anything for now
  end

  get '/' do
    erb :index
  end

  post '/checkout' do
    session[:debar] = params[:debar]
    @cessissioughn = session  # the instance variable can be named anything
    #binding.pry
    erb :checkout
  end

  get '/newindex' do
    erb :newindex
  end

  post '/mynewpost' do
    session[:myitem] = params[:myitem]
    @instancevar = session
    if session[:myitem] == "Zaza"
      redirect '/secret_chamber'
    else
    #binding.pry
      erb :mynewpost
    end
  end

  get '/secret_chamber' do
    if session[:myitem] == "Zaza"
      "Welcome to the Secret Chamber, you entered the password '#{session[:myitem]}'"
    else
      "ACCESS DENIED! You don't know the secret word."
    end 
  end
end
