class CreateAppScreenshots < ActiveRecord::Migration
  def change
    create_table :app_screenshots do |t|
      t.string :caption

      t.timestamps
    end
  end
end
