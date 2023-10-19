# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
    has_one_attached :eyecatch

    has_rich_text :content
    #バリデーションチェック

    validates :title, presence: true
    validates :title, length: { minimum: 2, maximum: 100}
    validates :title, format: { with: /\A(?!\@)/, message: '先頭に「@」は使えません' }

    validates :content, presence: true

    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user #相手モデルのhas_many :複数形 とセット

    def display_created_at
        #I18n は、internationalizationの略 internationalizationの先頭の文字i、最後の文字n、その間の文字数が18なので、I18nと略されている
        I18n.l(self.created_at, format: :default)
    end

    def author_name
        user.display_name
    end

    def like_count
        likes.count
    end

end
