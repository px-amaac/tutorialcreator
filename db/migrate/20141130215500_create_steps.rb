class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :title
      t.text :problem
      t.text :solution
      t.references :tutorial, index: true

      t.timestamps
    end
  end
end
