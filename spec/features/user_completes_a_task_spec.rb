require "rails_helper"

RSpec.feature "User completes a task" do
  scenario "the completed task has a line-through" do
    project = create(:project)

    visit project_path(project.id)

    fill_in :task_name, with: 'test_task'
    click_on "Create Task"
    click_on "complete-task-btn"
    
    expect(page).to have_css("span.project-task-name.line-through")
  end
end
