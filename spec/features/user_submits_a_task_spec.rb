require "rails_helper"

RSpec.feature "User creates a task" do
  scenario "they see the task in the project task list" do
    project = create(:project)

    visit project_path(project.id)

    fill_in :task_name, with: 'test_task'
    click_on "Create Task"

    # Expect a list item node in the node
    # with class "project-task-list"
    expect(page).to have_css "ul .task-list-item"
  end
end