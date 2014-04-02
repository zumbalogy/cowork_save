class MakeRantsTable < ActiveRecord::Migration
  def change
    create_table :rants do |t|
        t.string :title
        t.text :text
        t.timestamps
    end
  end
end
