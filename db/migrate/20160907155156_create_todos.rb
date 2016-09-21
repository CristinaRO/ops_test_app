class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name, null: false
    end
  end
end
