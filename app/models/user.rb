class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  validates_presence_of :name

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "http://orig09.deviantart.net/5d81/f/2013/125/7/2/kim_jong_un_by_jlr758-d649mib.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
