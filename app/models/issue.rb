class Issue < ApplicationRecord
  include Completable

  belongs_to :project
  
  validates :body, presence: :true, length: { minimum: 10 }
end
