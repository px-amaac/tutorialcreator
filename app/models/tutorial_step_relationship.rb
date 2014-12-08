class TutorialStepRelationship < ActiveRecord::Base
  belongs_to :tutorial
  belongs_to :step
end