class ReadingProgress < ApplicationRecord
  belongs_to :user
  belongs_to :bible_version
end
