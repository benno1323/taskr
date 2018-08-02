require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with a subject, description, priority, due date, and owner"
  it "is invalid without a subject"
  it "is invalid without a description"
  it "is invalid without a priority"
  it "is invalid without a due date"
  it "is invalid without a owner"
end
