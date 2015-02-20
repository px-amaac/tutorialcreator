class Project < ActiveRecord::Base
    belongs_to :user
    has_many :app_screenshots, :dependent => :destroy
    accepts_nested_attributes_for :app_screenshots, :reject_if => lambda {
    |t| t['app_screenshot'].nil? }, allow_destroy: true

end
