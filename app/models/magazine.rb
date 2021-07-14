class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  #map me a new array and everything in that array should have the reader email and then a semicolon
  def email_list
    self.readers.map { |reader| "#{reader.email};" }.join
end

def self.most_popular
    self.all.max_by { |mag| mag.subscriptions.length }
end
end