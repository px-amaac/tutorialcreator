class AddStepRefToCodeblocks < ActiveRecord::Migration
  def change
    add_reference :codeblocks, :step, index: true
  end
end
