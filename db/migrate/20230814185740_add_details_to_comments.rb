class AddDetailsToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true
    add_reference :comments, :post, null: false, foreign_key: true
    add_column :comments, :text, :string
  end
end
