class Task < ApplicationRecord
  include Completable
  
  belongs_to :project
end
