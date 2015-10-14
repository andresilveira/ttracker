module Web::Views
  module Helpers
    def self.included(view)
      define_method :link_to_back do |route|
        link_to "← Back", route, class: 'btn btn-link'
      end
    end
  end
end
