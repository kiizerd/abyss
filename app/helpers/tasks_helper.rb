module TasksHelper
  def task_complete_path task
    "/projects/#{task.project.id}/tasks/#{task.id}/complete"
  end

  def new_task_form project, &block
    task = project.tasks.build
    form_with model: [project, task] do |form|
      yield(form)
    end
  end

  def new_task_name_field form
    form.text_field :name,
                    placeholder: "New task",
                    class: "task-form-field"
  end

  def new_task_submit_button form
    form.submit "Create Task", class: 'px-2'
  end

  def task_completion_toggle_link task, &block
    link_id = "complete-#{dom_id(task)}-btn"
    link_data = { turbo_method: :post }

    link_to(task_complete_path(task), id: link_id, data: link_data) do
      yield
    end
  end

  def task_delete_link task, &block
    link_data = { turbo_method: :delete }
    
    link_to([task.project, task], data: link_data) do
      yield
    end
  end
end
