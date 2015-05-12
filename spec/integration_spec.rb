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

end
