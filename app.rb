require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/*.rb")
require("./lib/answer")
require("./lib/question")
require("./lib/survey")
require("./lib/user")
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
  @survey = Survey.new(description: @description)
  if @survey.save
    redirect("/surveys")
  else
    erb(:errors)
  end
end

get('/surveys/:id') do
  @id = params.fetch('id').to_i()
  @my_survey = Survey.find(@id)
  erb(:survey_edit)
end

patch('/surveys/:id') do
  @id = params.fetch('id').to_i()
  @my_survey = Survey.find(@id)
  @my_survey.update(description: params.fetch('description'))
  redirect("/surveys/#{@id}")
end

post('/surveys/:id') do
  @id = params.fetch('id').to_i()
  @my_survey = Survey.find(@id)
  @my_survey.questions.create(content: params.fetch('content'))
  redirect("/surveys/#{@id}")
end

delete('/surveys/:id') do
  @id = params.fetch('id').to_i()
  @my_survey = Survey.find(@id)
  @my_survey.delete()
  redirect("/surveys")
end

get('/questions/:id') do
  @id = params.fetch('id').to_i()
  @my_question = Question.find(@id)
  @my_survey = Survey.find(@my_question.survey_id)
  erb(:question_edit)
end

patch('/questions/:id') do
  @id = params.fetch('id').to_i()
  @my_question = Question.find(@id)
  @my_survey = Survey.find(@my_question.survey_id)
  @my_question.update(content: params.fetch('content'))
  redirect("/questions/#{@id}")
end

delete('/questions/:id') do
  @id = params.fetch('id').to_i()
  @my_question = Question.find(@id)
  @my_survey = Survey.find(@my_question.survey_id)
  @my_question.delete()
  redirect("/surveys/#{@my_survey.id}")
end

post('/questions/:id') do
  @id = params.fetch('id').to_i()
  @my_question = Question.find(@id)
  @my_survey = Survey.find(@my_question.survey_id)
  @my_question.answers.create(content: params.fetch('answer_content'))
  redirect("/questions/#{@id}")
end

get('/answers/:id') do
  @id = params.fetch('id')
  @my_answer = Answer.find(@id)
  erb(:answer_edit)
end

delete('/answers/:id') do
  @id = params.fetch('id')
  @my_answer = Answer.find(@id)
  @my_answer.delete()
  redirect("/questions/#{@my_answer.question_id}")
end

patch('/answers/:id') do
  @id = params.fetch('id')
  @my_answer = Answer.find(@id)
  @my_answer.update(content: params.fetch('content'))
  redirect("/answers/#{@id}")
end








#
