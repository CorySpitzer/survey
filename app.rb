require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/*.rb")
require("./lib/answer")
require("./lib/question")
require("./lib/survey")
require("pg")

get('/') do
  erb(:index)
end
