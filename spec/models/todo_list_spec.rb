require 'rails_helper'

RSpec.describe TodoList, type: :model do
  describe "Create Todo List" do
    describe "creates a todo list" do
      it "positive result" do
        expect(TodoList.new(title: 'chores', created_by: 'user')).to change(TodoList, count).by(1)
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
