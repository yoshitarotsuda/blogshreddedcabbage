class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title,            null: false
      t.references :user,         null: false, foreign_key: true # 外部キー設定
      t.timestamps
    end
  end
end
