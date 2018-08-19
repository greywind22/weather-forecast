class CreateLocationTable < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string 'name'
      t.text   'url'
    end
  end
end