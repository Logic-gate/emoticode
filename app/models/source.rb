class Source < ActiveRecord::Base
  belongs_to :language, :counter_cache => true
  belongs_to :user
  has_many   :links
  has_many   :tags, :through => :links
  has_many   :comments, 
    :foreign_key => :object_id, 
    :conditions => [ 'object_type = ?', Comment::OBJECT_TYPES[:source] ]

  default_scope :order => "created_at DESC"
  scope :popular, :order => 'views DESC'

  def path
    "/#{language.name}/#{name}.html"
  end

  def url
    "http://www.emoticode.net#{path}"
  end
end
