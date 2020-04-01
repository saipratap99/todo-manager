class TodosController < ApplicationController
  before_action :authenticate_user!

  skip_before_action :verify_authenticity_token

  def index
  end

  def show
    redirect_to edit_todo_path
  end

  def create
    new_todo = Todo.create!(todo_params)
    redirect_to todos_path
  end

  def update
    Todo.find(params[:id]).update(update_todo)
    redirect_to todos_path
  end

  def edit
  end

  def complete
    todo = Todo.find(params[:id])
    todo.completed = todo.completed.!
    todo.save
    redirect_to todos_path
  end

  def destroy
    Todo.find(params[:id]).destroy
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:todo_text, :due_date).merge(completed: false, user_id: current_user.id)
  end

  def update_todo
    params.require(:todo).permit(:todo_text, :due_date, :completed)
  end
end
