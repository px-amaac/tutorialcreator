class CreateCodeblocks < ActiveRecord::Migration
  def change
    create_table :codeblocks do |t|
      t.text :code
      t.text :description

      t.timestamps
    end
  end
end
