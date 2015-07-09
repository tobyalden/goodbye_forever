class Post < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :attached_file, presence: true
  validates :copies_remaining, presence: true
  belongs_to :user

  has_attached_file :attached_file
  do_not_validate_attachment_file_type :attached_file

end
