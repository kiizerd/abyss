require "rails_helper"

RSpec.feature "User creates a project" do
  scenario "they see the show page for the created project" do
    project_name = 'Testing Rails'
    project_description = 'Learning how to test rails apps by doing.'

    visit root_path
    click_on "New Project"
    fill_in "project_name", with: project_name
    fill_in "project_description", with: project_description
    click_on "Create Project"

    # bad test -- doesn't check anything we created
    # expect(page).to have_css('.project-task-list')
    name_element = find('#project-name')
    desc_element = find('#project-description')
    expect(name_element).to have_text(project_name)
    expect(desc_element).to have_text(project_description)
  end

  context 'the project form is invalid' do
    scenario "they see a relevant error message" do
      project_name = 'Invalid Project'
      
      visit root_path
      click_on "New Project"
      fill_in "project_name", with: project_name
      click_on "Create Project"

      expect(page).to have_content("Description can't be blank")
    end
  end
end