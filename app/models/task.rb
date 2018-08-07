class Task < ApplicationRecord
  validates :subject, :description, :priority, :due_date, presence: true

  belongs_to :user
end
