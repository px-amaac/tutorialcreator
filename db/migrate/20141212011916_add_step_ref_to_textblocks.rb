class AddStepRefToTextblocks < ActiveRecord::Migration
  def change
    add_reference :textblocks, :step, index: true
  end
end
