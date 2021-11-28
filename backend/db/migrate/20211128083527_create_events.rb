class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :starttime
      t.datetime :endtime
      t.text :description
      t.string :rsvp
      t.boolean :allday
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
