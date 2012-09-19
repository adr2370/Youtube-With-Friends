class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :address
      t.string :imageurl
      t.string :description

      t.timestamps
    end
  end
end
