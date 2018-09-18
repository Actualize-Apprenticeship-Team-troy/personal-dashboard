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
        expect(response).to redirect_to home_path
        expect(subject.request.flash[:success]).to eq("List was created successfully")
      end
      it "negative result" do
        user = create(:user)
        sign_in_user(user)
        params = { todo_list: {
                   title: 'chores',
                   created_by: nil
                 } }
        post :create, params: params
        todos = TodoList.all
        expect(todos.length).to eq(0)
        expect(response).to render_template(:new)
        expect(subject.request.flash[:warning]).to eq("List was not created successfully")
      end
    end
  end

  describe "Update Todo List" do
    let!(:todo_list) { create(:todoList) } 
    describe 'updates a todo list' do

      before {
        user = create(:user)
        sign_in_user(user)
        put :update, params: { todo_list: {:title => "Update Title", :created_by => "Updated"}, id: todo_list.id }
      }
     
        #create todo
        #pass params to change one or both attributes
        #post
        #create an instance variable of the todo
        #expect the attribute to be updated
        #expect a success flash message
        #expect to be redirected to home_path
    context "when success" do
      
      it "will redirect to root path" do
        
        expect(response).to redirect_to home_path
      end

      it "will change attributes" do
       todo_list = TodoList.first 
        expect(todo_list.title).to eq("Update Title")
 
      end
 
      it "will set flash[:success]" do
        expect(flash[:success]).to be_present
      end
    end
 
    context "when not success" do
     before {
        put :update, params: { todo_list: {:title => "", :created_by => ""}, id: todo_list.id }
      }
 
      it "will render new template" do
        expect(response).to redirect_to home_path
      end
 
      it "will set flash[:error]" do
        expect(flash[:warning]).to be_present
      end
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
