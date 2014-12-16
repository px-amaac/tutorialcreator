class Codeblock < ActiveRecord::Base
has_many :sections, as: :item, dependent: :destroy
end
