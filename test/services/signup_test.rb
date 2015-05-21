require 'test_helper'

module Api::Services
  describe Signup do
    attr_reader :service

    before do
      @service = Signup.new(email: "ex@example.com", password: "password")
      service.call
    end

    it "encrypts the password" do
      assert service.user.encrypted_password.length > 32
      "Expected password to be greater than 32, got #{service.user.encrypted_password.length}."
    end

    it "doesnt allow the password to be seen again" do
      service.user.password.must_be_nil
    end

    it "saves the user" do
      service.user.wont_be_nil
    end
    it "has a created_at timestamp" do
      service.user.created_at.must_be :<, Time.now
    end

    it "signs a user up" do
      service.status.must_equal :ok
    end
  end
end