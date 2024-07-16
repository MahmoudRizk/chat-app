class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :uuid
      t.string :name

      t.timestamps
    end
  end
end
