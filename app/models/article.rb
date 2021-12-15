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

  def tags_save(tag_list)
    if self.tags != nil
      article_tags_records = ArticleTag.where(article_id: self.id)
      article_tags_records.destroy_all
    end

    tag_list.each do |tag|
      inspected_tag = Tag.where(tag_name: tag).first_or_create
      self.tags << inspected_tag
    end
  end
end
