class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :task
      t.boolean :completed
      t.references :todo_list, foreign_key: true

      t.timestamps
    end
  end
end
