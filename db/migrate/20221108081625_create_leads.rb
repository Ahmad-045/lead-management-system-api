class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :project_name, null: false
      t.string :client_name, null: false
      t.string :client_address, null: false
      t.string :client_email, null: false
      t.string :client_contact, null: false
      t.string :platform_used, null: false
      t.integer :test_type, default: 0

      t.belongs_to :user

      t.timestamps
    end
  end
end
