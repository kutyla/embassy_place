class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content
  field :permalink

  before_validation :set_permalink, if: :set_permalink?
  validates_uniqueness_of :permalink
  validates_presence_of :title
  validates_presence_of :content

  class << self
    def find_by_permalink(string)
      where({ permalink: string}).first
    end
  end

  def to_param
    self.permalink
  end

  private

  def set_permalink?
    (permalink.blank? || title_changed?)
  end

  def set_permalink
    self.permalink = Permalink.new(title)
  end

end
