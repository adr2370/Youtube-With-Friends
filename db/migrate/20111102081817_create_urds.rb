class CreateUrds < ActiveRecord::Migration
  def change
    create_table :urds do |t|
      t.string :address
      t.string :imageurl
      t.string :description

      t.timestamps
    end
  end
end
