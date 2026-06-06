class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
       
  belongs_to :group, optional: true

  enum :role, {
    user: 0,
    manager: 1,
    admin: 2
  }
end