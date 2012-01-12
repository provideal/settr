class CreateSettrSettings < ActiveRecord::Migration
  def up
    create_table :settr_settings do |t|
      t.string    'key',        :unique => true
      t.string    'value'
      t.string    'typ'
      t.boolean   'alterable',  :default => true
      t.timestamps
    end
  end

  def down
    drop_table :settr_settings
  end
end