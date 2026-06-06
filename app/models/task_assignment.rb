class TaskAssignment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  belongs_to :gruop
end
