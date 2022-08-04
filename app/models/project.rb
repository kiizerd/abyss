class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  before_validation :ensure_status_has_a_value

  def ensure_status_has_a_value
    if status.nil?
      self.status = 'standby'
    end
  end
end
