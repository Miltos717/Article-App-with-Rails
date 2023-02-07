class AddUserIdToArticles < ActiveRecord::Migration[7.0]

  # add column into the articles table
  # the field i am adding is user_id
  # and the type is int
  def change
    add_column :articles, :user_id, :int
  end
end
