class CreatePostings < ActiveRecord::Migration[5.2]
  def change
    create_table :postings do |t|
      t.text        :text
      t.integer     :user_id
      t.integer     :genre
      t.integer     :likes_count
      t.timestamps
    end
  end
end

    # add_column :postings, :user_id, :integer
    # add_column :postings, :genre,:integer
    # add_column :postings, :likes_count,:integer
