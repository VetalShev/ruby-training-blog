class AddArticleAuthor < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :user, foreign_key: true
    add_foreign_key :articles, :users
  end
end
