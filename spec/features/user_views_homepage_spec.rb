require "rails_helper"

RSpec.feature 'User views homepage' do
  scenario "they see the existing projects" do
    project = create(:project)

    visit root_path

    expect(page).to have_content(project.name)
  end
end