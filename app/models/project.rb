class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :issues, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  default_scope -> { order(updated_at: :desc) }

  def self.most_active_first
    all_with_tasks = all.includes(:tasks)
    inactive = all_with_tasks.select { |project| project.activity == 0 }
    active = (all_with_tasks - inactive).sort { |a, b| b.activity <=> a.activity }

    active.push(*inactive)
  end

  def progress
    return nil if tasks.empty?
    
    tasks.select(&:complete?).size * 100 / tasks.size
  end
  
  def activity
    last_active = updated_at.to_i
    more_active_task = tasks.find { |t| t.updated_at.to_i > last_active }
    if more_active_task
      last_active = more_active_task.updated_at.to_i
    end
    
    return 0 if last_active == created_at.to_i

    # The smaller the difference
    # the more active the project
    last_active - Time.now.to_i
  end
end
