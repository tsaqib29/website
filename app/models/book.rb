class Book < ApplicationRecord
    belongs_to :category
    validates_associated :category
    validates :title, presence: true
    validates :author, presence: true
    validates :isbn, presence: true
    validates :description, presence: true
    validates :category_id, presence: true
end