class Post < ApplicationRecord
  validates :content, presence: true,length: { minimum: 1 }, length: { maximum: 140 }
end
