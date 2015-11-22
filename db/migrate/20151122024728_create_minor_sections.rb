class CreateMinorSections < ActiveRecord::Migration
  def change
    create_table :minor_sections do |t|
      t.string :name
      t.integer :row_order

      t.timestamps
    end
  end
end
