# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
    #バリデーションチェック

    validates :title, presence: true
    validates :title, length: { minimum: 2, maximum: 100}
    validates :title, format: { with: /\A(?!\@)/, message: '先頭に「@」は使えません' }

    validates :content, presence: true
    validates :content, length: { minimum: 10}
    validates :content, uniqueness: true

    validate :validate_title_and_content_length

    def display_created_at
        #I18n は、internationalizationの略 internationalizationの先頭の文字i、最後の文字n、その間の文字数が18なので、I18nと略されている
        I18n.l(self.created_at, format: :default)
    end

    private
    def validate_title_and_content_length
        char_count = self.title.length + self.content.length
        errors.add(:base, 'タイトルと内容、合わせて10文字いじょうで！(謎)') unless char_count > 10
    end
end
