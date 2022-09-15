module ProjectsHelper
  def correct_controller?
    controller.controller_name == 'projects'
  end

  def on_index_page?
    correct_controller? &&
    controller.action_name == 'index'
  end

  def on_show_page?
    correct_controller? &&
    controller.action_name == 'show'
  end

  def on_new_page?
    correct_controller? &&
    ['new', 'create'].include?(controller.action_name)
  end

  def on_edit_page?
    correct_controller? &&
    ['edit', 'update'].include?(controller.action_name)
  end

  def show_project_button project
    link_to project do
      heroicon 'link', options: { class: 'm-0 mx-1' }
    end
  end

  def edit_project_link project
    link_to 'Edit', edit_project_path(project), class: 'btn'
  end

  def edit_project_button project
    link_to edit_project_path(project.id) do
      heroicon 'pencil', options: { class: 'm-0 mr-1' }
    end
  end

  def delete_link_data
    { turbo_method: :delete, turbo_confirm: "Are you sure?" }
  end

  def delete_project_link project
    link_to 'Delete', project, class: 'btn', data: delete_link_data
  end

  def delete_project_button project
    link_to project, data: delete_link_data do
      heroicon 'trash', options: { class: 'm-0 mr-2' }
    end
  end
end
