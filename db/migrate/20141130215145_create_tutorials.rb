class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :author
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
