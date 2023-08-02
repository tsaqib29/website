class Book < ApplicationRecord
    belongs_to :category
    validates_associated :category
    validates :title, presence: true
    validates :author, presence: true
    validates :isbn, presence: true
    validates :description, presence: true
    validates :category_id, presence: true


    def self.search(search)
        where("lower(book.name) LIKE :search", search: "%#{search.downcase}%").uniq
    end

end