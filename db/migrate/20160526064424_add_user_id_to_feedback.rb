class AddUserIdToFeedback < ActiveRecord::Migration
  def change
    add_reference :feedback, :user, index: true, foreign_key: true
  end
end
