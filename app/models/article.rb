class Article < ApplicationRecord
    #バリデーションチェック
    validates :title, presence: true
    validates :content, presence: true
    validates :title, length: {maximum: 50 }

    def display_created_at
        #I18n は、internationalizationの略 internationalizationの先頭の文字i、最後の文字n、その間の文字数が18なので、I18nと略されている
        I18n.l(self.created_at, format: :default)
    end
end
