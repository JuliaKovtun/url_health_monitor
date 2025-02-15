# frozen_string_literal: true

class UrlMonitor < ApplicationRecord
  has_many :checks
  belongs_to :user

  validates :url, presence: true, url: true
  validates :check_interval, numericality: { greater_than_or_equal_to: 5 }
end
