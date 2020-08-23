class YieldFarmer::Exchange

    attr_accessor :name
     
     @@all = []
     
     
     def initialize(name)
       @name = name
       self.class.all<<self
     end
  
     def self.listed_coins
         exchanges =YieldFarmer::InterestProducts.all.select{|product|product.exchange}
         exchanges.each do |products|
             puts products.coins
         end 
     end 

     def self.add_Exchange(name)
        if  class.self.all.detect{|exchange| exchange.name == name}
            return nil 
        else  
            YieldFarmer::Exchange.new(name)
        end 
    end 

 
     def self.all 
         @@all 
     end
 

end