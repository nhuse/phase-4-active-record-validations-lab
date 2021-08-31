class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_is_clickbait

    def title_is_clickbait
        acceptable_strings = ["Won't Believe", "Secret", "Top ", "Guess"]
        unless title.include?("Won't Believe")
            errors.add(:category, "Title must be clickbaity")
        end
    end

end
