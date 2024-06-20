class CreateContents < ActiveRecord::Migration[7.1]
  def change
    create_table :contents do |t|
      t.text :body
      t.references :contentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
