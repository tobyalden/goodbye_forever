class Post < ActiveRecord::Base

  @@expiration_date = 30

  validates :name, presence: true
  validates :description, presence: true
  validates :attached_file, presence: true
  validates :copies_remaining, presence: true
  belongs_to :user

  has_attached_file :attached_file
  do_not_validate_attachment_file_type :attached_file

  def visible?
    if self.copies_remaining > 0
      return true
    elsif (DateTime.now.to_i - self.time_sold_out.to_i) < @@expiration_date
      return true
    else
      return false
    end
  end

end
