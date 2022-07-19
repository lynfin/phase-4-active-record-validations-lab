class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :clickbait_title

  def clickbait_title
    if title && !(title.include?("Won't Believe") || title.include?('Secret') || title.include?('Top ') || title.include?('Guess'))

      errors.add(:title, 'not clickbait-y enough')
    end
  end
end
