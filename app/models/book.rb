class Book < ApplicationRecord
    validates :title,presence: true
    validates :implession,length: {maximum: 200}
    
    belongs_to :user
end
