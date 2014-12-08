class Step < ActiveRecord::Base
  has_many :tutorial_step_relationships, dependent: :destroy
  has_many :tutorials, :through => :tutorial_step_relationships
  has_many :codeblocks, dependent: :destroy
end
