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
  end

end
