class Micropost < ActiveRecord::Base
belongs_to :user
 default_scope -> { order('created_at DESC') }
 validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
validates :user_id, presence: true

has_attached_file :image, styles: {medium: "200×150>", thumb: "50×50>"}

validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpeg image/png image/gif)

scope :search, ->(search_word){where("content LIKE ?", "%#{search_word}%")}

def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end

def self.search(search)
 if search
   scope :search, ->(search_word){where("content LIKE ?", "%#{search_word}%")}
  
 else
  
   Micropost.all
  end
 end