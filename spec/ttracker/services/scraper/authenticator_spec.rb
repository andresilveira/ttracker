require 'spec_helper'

describe Services::Scraper::Authenticator, vcr: { record: :new_episodes } do
  let(:subject) { Services::Scraper::Authenticator }

  it 'must have a username' do
    proc { subject.new username: nil, password: 'something' }.must_raise ArgumentError
  end

  it 'must have a password' do
    proc { subject.new username: 'something', password: '' }.must_raise ArgumentError
  end

  it 'must have a page to authenticate to' do
    proc { subject.new username: 'something', password: '' }.must_raise ArgumentError
  end

  describe '.authenticate!' do
    before do
      page_to_authenticate = Mechanize.new.get ENV['T_URL']
      @valid_user = Hash[username: ENV['T_USERNAME'],
                         password: ENV['T_PASSWORD'],
                         page: page_to_authenticate]
      @invalid_user = Hash[username: 'lololololo',
                           password: 'lolololololo',
                           page: page_to_authenticate]
    end

    it 'should return a page authenticated when successful' do
      page = subject.new(@valid_user).authenticate!
      page.uri.path.wont_include 'login'
    end

    it 'should raise an exception when failed' do
      proc { subject.new(@invalid_user).authenticate! }.must_raise subject::InvalidUserException
    end
  end
end
