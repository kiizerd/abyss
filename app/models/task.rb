class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true

  before_validation :ensure_status_has_a_value

  private
    def ensure_status_has_a_value
      if status.nil?
        self.status = 'standby'
      end
    end
end
