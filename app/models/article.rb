class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_rich_text :content
  has_many :article_tags, dependent: :destroy
  has_many :tags,through: :article_tags

  with_options presence: true do #with_options オプションの記述をまとめるのに使える、if使用時の記述パターンに注意
    validates :title
    validates :content
  end
end
