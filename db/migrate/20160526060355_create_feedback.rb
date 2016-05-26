class CreateFeedback < ActiveRecord::Migration
  def change
    create_table :feedback do |t|
      t.string :message

      t.timestamps null: false
    end
  end
end
