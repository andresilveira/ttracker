module Web::Views
  # module with view helpers methods used accross the application
  module Helpers
    def self.included(_view)
      define_method :link_to_back do |route|
        link_to '← Back', route, class: 'btn btn-link'
      end
    end
  end
end
