module Completable
  extend ActiveSupport::Concern

  VALID_STATUSES = ['standby', 'in-progress', 'complete', 'archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def completed_count
      where(status: 'complete').count
    end
  end

  def in_progress?
    status == 'in-progress'
  end

  def complete?
    status == 'complete'
  end

  def archived?
    status == 'archived'
  end
end