class TodosController < ApplicationController
  def index
    @todo_lists = TodoList.all
  end

  def show
    @todo_list = TodoList.find_by(id: params[:id])
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    if @todo_list.save
      flash[:success] = "List was created successfully"
      redirect_to (home_path)
    else
      flash[:warning] = "List was not created successfully"
      render :new
    end
  end

  def update
    @todo_list = TodoList.find_by_id(params[:id])
   if  @todo_list.update(todo_list_params)
      flash[:success] = "List was updated successfully"
      redirect_to (home_path)
    else
      flash[:warning] = "List was not updated successfully"
      redirect_to (home_path)
    end
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
