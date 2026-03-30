class AddPublishedToArticles < ActiveRecord::Migration[8.1]
  def change
    add_column :articles, :published, :boolean
  end
end
