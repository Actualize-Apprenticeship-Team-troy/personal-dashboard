class TodoListsController < ApplicationController
  def index
    @todo_lists = TodoList.all
  end

  def show
    id = todo_list.id
    @todo_list = TodoList.find_by(:id)
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.save
  end

  def update
    id = todo_list.id
    @todo_list = TodoList.find_by(:id)
    @todo_list.update(todo_list_params)
  end

  def destroy
    id = todo_list.id
    @todo_list = TodoList.find_by(:id)
    @todo_list.destroy
  end

  private
    def todo_list_params
      params.require(:todo_list).permit(:title, :created_by)
    end
end
