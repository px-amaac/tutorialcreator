class Tutorial < ActiveRecord::Base
  belongs_to :user
  has_many :tutorial_step_relationships, dependent: :destroy
  has_many :steps, :through => :tutorial_step_relationships
end
