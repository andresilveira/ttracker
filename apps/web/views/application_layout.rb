module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def app_name
        'TTracker'
      end
    end
  end
end
