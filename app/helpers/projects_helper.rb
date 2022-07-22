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
end
