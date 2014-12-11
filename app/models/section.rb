class Section < ActiveRecord::Base
  belongs_to :step
  belongs_to :item, polymorphic: true
end
