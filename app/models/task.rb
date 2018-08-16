class Task < ApplicationRecord
  validates :subject, :description, :priority, :status, presence: true
  before_validation :setup_due_date
  belongs_to :user

  PRIORITY = ["High", "Medium", "Low"]
  STATUS = ["New", "Work in Progress", "Closed"]

  def setup_due_date
    t = DateTime.now
    count = 0

    while (count <= 20) do
      if !t.saturday? && !t.sunday?
        self.due_date = t
        count += 1
      end
      t = t + 1
    end
  end
end
