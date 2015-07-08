class AddAttachmentAttachedFileToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :attached_file
    end
  end

  def self.down
    remove_attachment :posts, :attached_file
  end
end
