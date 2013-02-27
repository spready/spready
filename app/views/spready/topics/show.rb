module Spready
  module Topics
    class Show < ::Stache::Mustache::View

      def title
        @topic.title
      end

      def content
        @topic.content
      end

      def comments_form
        semantic_form_for( @comment, :url => comments_path(:topic_id => @topic.id) ) do |f|
          concat f.input :content,  :as => :text
          concat f.actions
        end
      end

      def comments
        @topic.comments
      end

    end
  end
end
