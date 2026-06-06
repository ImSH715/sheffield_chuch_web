class Task < ApplicationRecord
  belongs_to :group
  belongs_to :created_by
end
