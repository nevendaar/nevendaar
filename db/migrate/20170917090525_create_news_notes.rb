class CreateNewsNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :news_notes do |t|
      t.string :title
      t.text :brief
      t.text :text
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
