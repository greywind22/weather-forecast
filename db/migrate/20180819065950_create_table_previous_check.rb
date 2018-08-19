class CreateTablePreviousCheck < ActiveRecord::Migration[5.1]
  def change
    create_table :previous_checks do |t|
      t.integer 'location_id'
      t.string 'wind'
      t.string 'temperature'
      t.string 'humidity'
      t.datetime 'created_at'
    end
  end
end
