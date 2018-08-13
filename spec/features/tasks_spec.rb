require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  before(:each) do
    @user = create(:user)
    @task = build(:task)
  end

  scenario "POST #create" do
    visit root_path
    log_in(@user)

    expect {
      create_task(@task)
    }.to change(@user.tasks, :count).by(1)

    expect(page).to have_content("Task created successfully!")
  end

  scenario "GET #index" do
    visit root_path
    log_in(@user)
    create_task(@task)
    visit tasks_path

    expect(page).to have_content("Subject")
    expect(page).to have_content("Description")
    expect(page).to have_content("Priority")
    expect(page).to have_content("Due Date")
    expect(page).to have_content(@task.subject)
    expect(page).to have_content(@task.description.truncate(20))
    expect(page).to have_content(@task.priority)
    # expect(page).to have_content("2018-09-07")
  end

  scenario "GET #show" do
    visit root_path
    log_in(@user)
    create_task(@task)
    expect(page).to have_content(@task.subject)
  end

  scenario "PATCH #update" do
    visit root_path
    log_in(@user)
    task = create(:task)
    visit edit_task_path(task)
    expect(page).to have_content("Edit Task")
    update_task
    expect(page).to have_content("Updated subject")
  end

  private

  def log_in(resource)
    click_link("Log In")
    fill_in("Email", with: resource.email)
    fill_in("Password", with: resource.password)
    click_button("Log in")
  end

  def create_task(task)
    click_link("Add Task")
    fill_in("Subject", with: task.subject)
    fill_in("Description", with: task.description)
    select(task.priority, from: "Priority")
    click_button("Create")
  end

  def update_task
    fill_in("Subject", with: "Updated subject")
    click_button("Update Task")
  end
end
