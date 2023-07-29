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
    validates :title, presence: true #空白禁止
    validates :content, presence: true #空白禁止
    validates :title, length: {maximum: 50 } #最大50文字まで

    def display_created_at
        #I18n は、internationalizationの略 internationalizationの先頭の文字i、最後の文字n、その間の文字数が18なので、I18nと略されている
        I18n.l(self.created_at, format: :default)
    end
end
