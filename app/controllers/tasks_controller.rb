class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    load_tasks
    load_open_tasks
    load_closed_tasks
  end

  def show
    load_task
  end

  def new
    new_task
  end

  def create
    build_task
    save_task or render :new
  end

  def edit
    load_task
  end

  def update
    load_task
    update_task or render :edit
  end

  def destroy
    load_task
    delete_task
  end

  private

  def task_params
    params.require(:task).permit(:subject, :description, :priority, :status)
  end

  def task_scope
    Task.all
  end

  def load_tasks
    @tasks = task_scope.where(status: "New").to_a
  end

  def load_open_tasks
    @open_tasks = task_scope.where(status: "Work in Progress").to_a
  end

  def load_closed_tasks
    @closed_tasks = task_scope.where(status: "Closed").to_a
  end

  def new_task
    @task = Task.new
  end

  def build_task
    @task = current_user.tasks.build(task_params)
  end

  def save_task
    redirect_to @task, notice: 'Task created successfully!' if @task.save
  end

  def load_task
    @task = task_scope.find(params[:id])
  end

  def update_task
    redirect_to @task, notice: 'Task updated successfully!' if @task.update(task_params)
  end

  def delete_task
    redirect_to tasks_path, notice: 'Task was successfully destroyed!' if @task.destroy
  end
end
