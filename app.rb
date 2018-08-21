require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'



get '/' do
  erb :about
end

get '/start' do

  @title = "Users list"
  @logfile = File.open './public/users.txt', 'r'

  erb :showu

end

get '/visit' do
  erb :visit
end

post '/visit' do

  @name_ = params[:name_]
  @cell_number = params[:cell_]
  @date_time = params[:date_]

  f = File.open './public/users.txt', 'a'
  f.write "\n user: #{@name_.capitalize}; cell: #{@cell_number}; date: #{@date_time}"
  f.close
  erb :visit

end


