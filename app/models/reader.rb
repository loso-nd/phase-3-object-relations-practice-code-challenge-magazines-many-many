class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    #using the schema as reference
    #self.id is called on a reader, note we are in the reader file 
    Subscription.create(magazine_id: magazine.id, price: price, reader_id: self.id)
  end

  #give me an array of all this readers subscriptions prices
  #we can add .sum at the end of pi
  def total_subcription_price
    self.subscriptions.map { |sub| sub.price}.sum
  end

  # def cancel_subscription(magazine)
  #   self.subscriptions.map { |sub| sub.magazine == magazine }.destroy
  # end

  def cancel_subscription(magazine)
    self.subscriptions.find { |sub| sub.magazine == magazine}.destroy
end

end

#has_many : ( a method that can take either one or two arguments)

#Commands:  Reader.first.subscribe(magazine.first, 12)