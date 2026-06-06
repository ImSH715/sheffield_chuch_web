class PrayerRequest < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :written_for
end
