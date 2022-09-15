module Completable
  extend ActiveSupport::Concern
  
  included do
    validates :name, presence: true

    before_validation :ensure_status_has_a_value
    
    enum status: {
      standby: 1,
      in_progress: 2,
      complete: 3
    }
  end

  private
    def ensure_status_has_a_value
      if status.nil?
        self.status = 1
      end
    end
end