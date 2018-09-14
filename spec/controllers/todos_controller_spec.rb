require 'rails_helper'
include SignIn

RSpec.describe TodosController, type: :controller do
  describe "#INDEX" do
    it "respond successfully" do
      user = create(:user)
      sign_in_user(user)
      get :index 
      expect(response).to be_success
    end
  end

  describe "#SHOW" do
    describe "as authorized user" do
      it "positive result" do
        user = create(:user)
        sign_in_user(user)
        get :show, params: {id: user.id}
        expect(response).to be_success
      end
    end
    describe "as unauthorized user" do
      it "negative result" do
        user = create(:user)
        get :show, params: {id: 2}
        expect(response).to redirect_to login_path
      end
    end
  end


  describe "#CREATE" do
    describe "creates a todo list" do
      it "positive result" do
        user = create(:user)
        sign_in_user(user)
        params = { todo_list: {
                   title: 'chores',
                   created_by: user.username
                 } }
        post :create, params: params
        todos = TodoList.all
        expect(todos.length).to eq(1)
      end
    end
  end

  describe "Update Todo List" do
    describe 'updates a todo list' do
      it 'positive result' do
        expect(TodoList.update(title: 'Chores', created_by: 'new_user')).to be_valid
      end
    end
  end

  describe "Delete Todo List" do
    describe 'deletes a todo list' do
      it 'positive result' do
        expect(TodoList.destroy)
      end
    end
  end
end
