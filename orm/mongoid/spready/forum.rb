module Spready
  class Forum
    include Mongoid::Document
    include Mongoid::Timestamps
  
    field :name,      :type => String
    field :permalink, :type => String
    field :theme,     :type => String, :default => 'spready'

    has_many :categories, :class_name => 'Spready::Category'

    # Who create this forum
    belongs_to :creater, :class_name => Spready.user_class.to_s

    validates :name, :presence => true, :uniqueness => true

    validates :permalink, :uniqueness => true

    before_create :generate_permalink_if_need

    def to_param
      permalink
    end

    protected
    def generate_permalink_if_need
      self.permalink = self.name.to_url if self.permalink.blank?
    end

  end
end