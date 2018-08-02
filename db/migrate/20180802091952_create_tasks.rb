class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :subject
      t.text :description
      t.string :priority
      t.date :due_date

      t.timestamps
    end
  end
end
