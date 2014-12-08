class CreateTutorialStepRelationship < ActiveRecord::Migration
  def change
    create_table :tutorial_step_relationships do |t|
      t.references :tutorial, index: true
      t.references :step, index: true
    end
  end
end
