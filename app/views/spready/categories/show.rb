module Spready
  module Categories
    class Show < ::Stache::Mustache::View

      def current_forum_name
        @forum.name
      end

      def current_forum_link
        link_to current_forum_name, @forum, :title => current_forum_name
      end

      def current_category_name
        @category.name
      end

      def new_topic_link
        link_to 'new topic', new_forum_topic_path(@forum, :category_id => @category.permalink)
      end

      def topics
        @category.topics.map do |topic|
          {:title => topic.title, :link => forum_topic_path(@forum,topic)}
        end
      end

    end
  end
end