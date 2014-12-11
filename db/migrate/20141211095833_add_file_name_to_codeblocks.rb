class AddFileNameToCodeblocks < ActiveRecord::Migration
  def change
    add_column :codeblocks, :file_name, :string
  end
end
