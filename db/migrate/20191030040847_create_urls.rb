class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :url, null: false
      t.string :slug, null: false
      t.string :from_domain, null: false

      t.timestamps
    end

    add_index :urls, :slug, unique: true
  end
end
