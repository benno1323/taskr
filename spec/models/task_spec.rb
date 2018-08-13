require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:each) { @task = build(:task) }

  it "is valid with a subject, description, priority, due date, and owner" do
    expect(@task).to be_valid
  end

  it "is invalid without a subject" do
    @task.subject = nil
    expect(@task).to_not be_valid
  end

  it "is invalid without a description" do
    @task.description = nil
    expect(@task).to_not be_valid
  end

  it "is invalid without a priority" do
    @task.priority = nil
    expect(@task).to_not be_valid
  end

  it "is invalid without a owner" do
    @task.user_id = nil
    expect(@task).to_not be_valid
  end

  # it "has a due date 20 days from today" do
  #   @task.due_date = DateTime.new(2018, 8, 9)
  #   @task.save
  #   expect(@task.due_date).to eq("Fri, 07 Sep 2018".to_datetime)
  # end
end
