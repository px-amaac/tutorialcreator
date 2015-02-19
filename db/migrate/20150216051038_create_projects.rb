class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projectName
      t.text :description
      t.string :site

      t.timestamps
    end
  end
end
