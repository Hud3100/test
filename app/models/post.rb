class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_category_relations, dependent: :destroy
  has_many :categories, through: :post_category_relations
end
