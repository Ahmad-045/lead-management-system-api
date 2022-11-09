class CreatePhases < ActiveRecord::Migration[5.2]
  def change
    create_table :phases do |t|
      t.references :manager, null: false, foreign_key: { to_table: :users }
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :phase_name, null: false
      t.integer :status, default: 0, null: false
      t.belongs_to :lead

      t.timestamps
    end
  end
end
