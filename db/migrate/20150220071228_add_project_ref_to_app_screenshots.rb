class AddProjectRefToAppScreenshots < ActiveRecord::Migration
  def change
    add_reference :app_screenshots, :project, index: true
  end
end
