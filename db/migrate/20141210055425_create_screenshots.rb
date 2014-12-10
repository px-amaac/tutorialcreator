class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.string :caption
      t.text :description
      t.references :step, index: true

      t.timestamps
    end
  end
end
