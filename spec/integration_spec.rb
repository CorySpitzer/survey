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

end
