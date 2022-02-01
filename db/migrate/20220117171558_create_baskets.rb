class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.string :sales_taxes
      t.string :total
      t.string :name

      t.timestamps
    end
  end
end
