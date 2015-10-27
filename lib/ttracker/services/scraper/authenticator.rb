require 'mechanize'

module Services
  module Scraper
    class Authenticator
      def initialize(username:, password:, page:)
        fail ArgumentError if username.to_s.blank? || password.to_s.blank? || page.nil?

        @username = username
        @password = password
        @page = page
      end

      def authenticate!
        @page = @page.form_with(id: authentication_form_id) do |form|
          form.field_with(name: username_field_name).value = @username
          form.field_with(name: password_field_name).value = @password
        end.submit

        assert_authenticated
      end

      private

      def assert_authenticated
        fail InvalidUserException if @page.uri.path.include? 'login'
        @page
      end

      def authentication_form_id
        'validation'
      end

      def username_field_name
        'auth'
      end

      def password_field_name
        'password'
      end

      class InvalidUserException < Exception
      end
    end
  end
end
