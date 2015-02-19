class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :companyName
      t.string :jobTitle
      t.text :jobDescription
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end
end
