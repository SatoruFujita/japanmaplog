class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures , id:false do |t|
      t.column :id, 'INTERGER PRIMARY KEY NOT NULL'
      t.string :name

      t.timestamps
    end
  end
end
