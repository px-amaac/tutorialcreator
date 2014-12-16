class CreateTextblocks < ActiveRecord::Migration
  def change
    create_table :textblocks do |t|
      t.string :title
      t.text :textblock

      t.timestamps
    end
  end
end
