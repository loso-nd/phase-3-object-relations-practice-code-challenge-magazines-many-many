class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    Subscription.create(magazine_id: magazine.id, price: price, reader_id: self.id)
    #this method is called on the reader, therefore we don't need an #arg for it if we are caling it on the reader itsel, which is what #were are trying to access
  end


  #we can add .sum at the end of pi
  def total_subcription_price
    self.subscriptions.map { |sub| sub.price}.sum
  end

  def cancel_subscription(magazine)
    #self.subscriptions.find { |sub| sub.magazine == magazine}.destroy
end

end

#has_many : ( a method that can take either one or two arguments)

#subscribe method
  #using the schema as reference
  #self.id is called on a reader, note we are in the reader file 
  #Commands:
    # Reader.first.subscriptions
    # Reader.first.subscribe(Magazine.first, 12) =>
    # Reader.first(is the reader we are calling it on, call #subscribe, feed it a whole magazine), and a random price.)

#total_subcription_price
  #We want all of the subscriptions for whatever reader we call it on.
  #give me an array of all this readers subscriptions prices
  #If we are looking for a total use .map and .sum at end
  #Commands
    # Reader.first.subscriptions
    # Reader.first.total_subcription_price => by adding a .sum at the end of the array of numbers in the cosole or on line 13, ruby will sum up the elemetns in the array. 

# cancel_subscription
#   we want to look at the readers subscribtions
#   since cancel_subscription is called on an instance of a reader, we can say self.subscriptions bc we want to delete a subscription & we know that subscriptions we're looking at is called on whateva reader we call cancel_subscriptions on. 
#   find is an iterator like map except it return a boolean, it will look thru the subs and find the one where subs magazine matches the magazines we took in as an arg.
  #Commands 
    #Reader.first.subscriptions
    #Reader.first.subscriptions => #<Subscription:0x00007fcaca867a30 id: 22, magazine_id: 9, reader_id: 11, price: 12> returns as an obj
    #if we chang find to select it returns an array not an object