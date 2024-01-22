class CreateInsultFormats < ActiveRecord::Migration[7.1]
  def change
    create_table :insult_formats do |t|
      t.string :insult_format

      t.timestamps
    end
  end
end
