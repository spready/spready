module Spready
  class Category
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name,      :type => String
    field :permalink, :type => String

    has_many    :topics,  :class_name => 'Spready::Topic'
    belongs_to  :creater, :class_name => Spready.user_class.to_s
    belongs_to  :forum,   :class_name => 'Spready::Forum'
    
    #TODO: same forum have uniqueness name
    validates :name, :presence => true, :uniqueness => true

    validates :permalink, :uniqueness => true

    before_create :generate_permalink_if_need

    def to_param
      permalink
    end

    protected
    def generate_permalink_if_need
      #TODO: same forum have uniqueness permalink
      self.permalink = self.name.to_url if self.permalink.blank?
    end

  end
end