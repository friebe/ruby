class AddCommentsTbl < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :author
      t.string :body
      t.integer "project_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["project_id"], name: "index_comments_on_project_id"
    end
  end
end
