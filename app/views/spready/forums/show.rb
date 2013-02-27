module Spready
  module Forums
    class Show < ::Stache::Handlebars::View

      def current_forum_name
        'xx'
      end

      def categories
        # @forum.categories.map do |category|
        #   {:name => category.name, :link => forum_category_path(@forum,category)}
        # end
      end

    end
  end
end