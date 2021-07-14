class Subscription < ActiveRecord::Base
  belongs_to :magazine
  belongs_to :reader

  def print_details
    puts "#{self.reader.name} subscribed to #{self.magazine.title} for $#{self.price}"
  end
end


# Subscription.first => #<Subscription:0x00007fe090c68180 id: 1, magazine_id: 14, reader_id: 19, price: 92>

# Subscription.first.reader => #<Reader:0x00007fe08e41cde8 id: 19, name: "Mr. Paulita Upton", email: "valorie@johnson.net">

# Subscription.first.reader.name => "Mr. Paulita Upton"