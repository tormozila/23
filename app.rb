require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'



get '/' do

  erb "12345"


end

get '/start' do

  @title = "Users list"
  @logfile1 = File.open './public/users.txt', 'r'
  @logfile = File.open './public/users.txt', 'r'
  @master_arr = ["John", "Bill", "Jessie", "Martin"]

  @arr = []
  @arr1 = []
  @value = nil
  @value1 = nil

  while (@line = @logfile.gets)

    @value = @line.split ";"
    @arr << @value[3].to_s
  end
  @arr.each do |line|

    @value1 = line.split ":"
    @arr1 << @value1[1].to_s
  end

 erb :showu

end

get '/visit' do
  erb :visit
end

post '/visit' do

  @name_ = params[:name_]
  @cell_number = params[:cell_]
  @date_time = params[:date_]
  @master_ = params[:master_]

  f = File.open './public/users.txt', 'a'
  f.write "\n user: #{@name_.capitalize}; cell: #{@cell_number}; date: #{@date_time}; master: #{@master_}"
  f.close
  erb :visit

end
