class User < ApplicationRecord
  belongs_to :group, optional: true

  enum role: {
    user: "user",
    manager: "manager",
    admin: "admin"
  }
end