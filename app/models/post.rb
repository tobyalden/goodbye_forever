class Post < ActiveRecord::Base

  @@expiration_date = 24 * 60 * 60

  validates :attached_file, presence: true
  validates :copies_remaining, presence: true
  belongs_to :user

  has_attached_file :attached_file
  do_not_validate_attachment_file_type :attached_file

  def in_stock?
    return self.copies_remaining > 0
  end

  def on_display?
    if self.copies_remaining <= 0
      return (DateTime.now.to_i - self.time_sold_out.to_i) < @@expiration_date
    else
      return true
    end
  end

end
