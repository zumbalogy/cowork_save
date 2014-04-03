class MakeRantsTable < ActiveRecord::Migration
  def change
    create_table :rants do |t|
        t.string :title
        t.text :text
        t.integer :relate_count, default: 0
        t.timestamps
    end
  end
end
