# frozen_string_literal: true

class Student < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 8, maximum: 300 }
end
