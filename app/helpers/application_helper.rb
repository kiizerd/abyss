module ApplicationHelper
  def completion_toggle_button model
    path = model.is_a?(Issue) ? issue_complete_path(model) : task_complete_path(model)
    id = "complete-#{dom_id(model)}-btn"
    link_to(path, id: id, data: { turbo_method: :post }) do
      heroicon(model.complete? ? "refresh" : "check")
    end
  end

  def delete_completable_button model
    path = [model.project, model]
    id = "delete-#{dom_id(model)}-btn"
    link_to(path, id: id, data: { turbo_method: :delete }) do
      heroicon "trash"
    end
  end

  def dropdown_toggle_button controller, action, target="chevron"
    dropdown_options = {
      disable_default_class: true,
      class: 'icon-no-btn cursor-pointer rotate-180',
      "data-action" => "click->#{controller}##{action}",
      "data-#{controller}-target" => "#{target}"
    }

    heroicon "chevron-up", options: dropdown_options
  end
end
