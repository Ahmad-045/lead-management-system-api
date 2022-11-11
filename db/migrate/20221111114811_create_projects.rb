class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.belongs_to :lead
      t.date :conversion_date, null: false
    end
  end
end
