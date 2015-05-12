require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('The Survey App', type: :feature) do
  describe('The root path') do
    it('visits the dome page') do
      visit('/')
      expect(page).to have_content('Surveys!')
    end
  end

  describe('the add survey path') do
    it('adds a survey') do
      visit('/surveys')
      fill_in('description', with: 'Your mood!')
      click_button('Add')
      expect(page).to have_content('Your mood')
    end
  end

  describe('the edit survey path') do
    it('edits a survey name') do
      survey = Survey.create(description: 'Your mood!')
      visit("/surveys/#{survey.id}")
      fill_in('description', with: 'Not Your Mood')
      click_button('Change')
      expect(page).to have_content('Edit Survey: Not Your Mood')
    end
  end

  describe('the delete survey from survey_edit path') do
    it('deletes a survey') do
      survey = Survey.create(description: 'Mood')
      visit("/surveys/#{survey.id}")
      click_button('Delete Survey')
      expect(page).to_not have_content('Mood')
    end
  end

  describe('the survey delete button on the surveys page') do
    it('deletes a survey from the surveys page') do
      survey = Survey.create(description: 'Mood')
      visit('/surveys')
      click_button('Delete Survey')
      expect(page).to_not have_content('Mood')
    end
  end

  describe('the add questions button') do
    it('adds a question to a survey') do
      survey = Survey.create(description: 'Mood')
      visit("/surveys/#{survey.id}")
      fill_in('content', with: 'Why?')
      click_button('Add Question')
      expect(page).to have_content('Why?')
    end
  end

  describe('the survey questions path') do
    it('displays a question page') do
      survey = Survey.create(description: 'Mood')
      question = Question.create(content: 'Why?', survey_id: survey.id)
      visit("/questions/#{question.id}")
      expect(page).to have_content('Why?')
    end

    it('deletes a question') do
      survey = Survey.create(description: 'Wherefores')
      question = Question.create(content: "Who?", survey_id: survey.id)
      visit("/questions/#{question.id}")
      click_button('Delete question')
      expect(page).to_not have_content("Who?")
    end
  end

  describe('adding answers to a question') do
    it('allows adding answer') do
      survey = Survey.create(description: 'Important stuff')
      question = Question.create(content: "What is the mostest?", survey_id: survey.id)
      visit("/questions/#{question.id}")
      fill_in('answer_content', with: 'Spondoolich')
      click_button('Add Answer')
      expect(page).to have_content('Spondoolich')
    end
  end

  describe('deletes an answer') do
    it('allows deleting an answer') do
      survey = Survey.create(description: 'Important stuff')
      question = survey.questions.create(content: "What is the mostest?")
      answer = question.answers.create(content: "Uff")
      visit("/answers/#{answer.id}")
      click_button('Delete Answer')
      expect(page).to_not have_content('Spondoolich')
    end
  end


end











#
