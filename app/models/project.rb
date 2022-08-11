class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  def progress
    return nil if tasks.empty?
    
    tasks.select(&:complete?).size * 100 / tasks.size
  end
end
