class Client < ApplicationRecord
  belongs_to :user
  has_many :deposits, dependent: :destroy
  has_many :securities, dependent: :destroy
  has_many :insurances, dependent: :destroy
  has_many :real_estates, dependent: :destroy
  has_many :claims, dependent: :destroy
  has_many :other_properties, dependent: :destroy
  has_many :debts, dependent: :destroy
  has_many :inheritance_properties, dependent: :destroy
end
