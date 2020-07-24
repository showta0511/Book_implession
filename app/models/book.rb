class Book < ApplicationRecord
    validates :title,presence: true
    validates :implession,length: {maximum: 200}
    
    mount_uploader :img,AvatarUploader
    belongs_to :user
end
