class AddSaleToLead < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :sale, :date
  end
end
