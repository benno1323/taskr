class Task < ApplicationRecord
  validates :subject, :description, :priority, presence: true
  before_validation :setup_due_date, :set_priority_as_text
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

  def set_priority_as_text
    case self.priority
    when "1"
      self.priority = "High"
    when "2"
      self.priority = "Medium"
    when "3"
      self.priority = "Low"
    end
  end
end
