class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :step, index: true
      t.references :item, polymorphic: true, index: true

      t.timestamps
    end
  end
end
