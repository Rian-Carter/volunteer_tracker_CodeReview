require('capybara/rspec')
require('./app')
require('pry')
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_expections, false)

describe 'the project cration path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a project' do
    visit '/'
    fill_in('title', :with => 'Teaching kids to code')
    click_button('Create')
    expect(page).to have_content('Teaching kids to code')
  end
end

describe 'the project update path', {:type => :feature} do
  it 'allows a user to change the name of the project' do
    test_project = Project.new({:title => 'Teaching kids to code', :id => nil})
    test_project.save
    visit '/'
    click_link('Teaching kids to code')
    click_link('Edit Project')
    fill_in('title', :with => 'Teaching ruby to kids')
    click_button('Update')
    expect(page).to have_content('Teaching ruby to kids')
  end
end

describe 'the project delete path', {:type => :feature} do
  it 'allows a user to delete a project' do
    test_project = Project.new({:title => 'Teaching kids to code', :id => nil})
    test_project.save
    visit "/projects/#{test_project.id}"
    click_link('Edit Project')
    click_button('Delete Project')
    visit '/'
    expect(page).not_to have_content('Teaching kids to code')
  end
end