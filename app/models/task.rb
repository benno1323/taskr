class Task < ApplicationRecord
  validates :subject, :description, :priority, presence: true
  before_validation :setup_due_date
  belongs_to :user

  def setup_due_date
    t = DateTime.now
    count = 0

    while (count <= 20) do
      if !t.saturday?
        if !t.sunday?
          self.due_date = t
          count = count + 1
        end
      end
      t = t + 1
    end
  end
end
