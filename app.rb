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

get('/surveys') do
  @surveys = Survey.all
  erb(:surveys)
end

post('/surveys') do
  @description = params.fetch('description')
  Survey.create(description: @description)
  redirect("/surveys")
end

get('/surveys/:id') do
  @id = params.fetch('id').to_i()
  @my_survey = Survey.find(@id)
  erb(:survey_edit)
end

post('/surveys/:id') do
  @id = params.fetch('id').to_i()
  @my_survey = Survey.find(@id)
  redirect("/surveys/#{@id}")
end
