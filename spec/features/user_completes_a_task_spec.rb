require "rails_helper"

RSpec.feature "User completes a task" do
  scenario "the completed task has a line-through" do
    project = create(:project)

    visit project_path(project.id)

    fill_in :task_name, with: 'test_task'
    click_on "Create Task"
    click_on "complete-task_#{project.tasks.last.id}-btn"
    
    expect(page).to have_css("span[data-status=complete]")
  end

  scenario "works correctly in reverse" do
    project = create(:project)

    visit project_path(project.id)

    fill_in :task_name, with: 'test_task'
    click_on "Create Task"
    button_id = "complete-task_#{project.tasks.last.id}-btn"
    # Click once to complete
    click_on button_id
    # Click again to uncomplete
    click_on button_id
    
    expect(page).to_not have_css("span[data-status=complete]")    
  end
end
