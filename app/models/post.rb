class Post < ApplicationRecord
  belongs_to :city
  belongs_to :user

  validates :title, :content, :presence => true
  validates :title, :length => { :minimum => 1 }
  validates :title, :length => { :maximum => 200 }
end
