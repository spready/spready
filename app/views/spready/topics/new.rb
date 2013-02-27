module Spready
  module Topics
    class New < ::Stache::Mustache::View
      
      def form
        categories_options_for_select = options_from_collection_for_select(@forum.categories, 'permalink', 'name', @category.permalink)
        semantic_form_for( @topic, :url => forum_topics_path(@forum) ) do |f|
          concat f.input :title
          concat f.input :content,  :as => :text
          concat f.input :category, :as => :select, 
                                    :collection => categories_options_for_select, 
                                    :include_blank => false
          concat f.actions
        end
      end

    end
  end
end