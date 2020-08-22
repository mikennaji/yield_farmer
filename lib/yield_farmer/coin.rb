class YieldFarmer::Coin 
    
    attr_accessor :name
   
    @@all = []
     
    def initialize(name)
      @name = name
    end
 
    def self.listed_exchanges
        exchanges =YieldFarmer::InterestProducts.all.select{|product|product.coin}
        exchanges.each do |products|
            puts products.exchange.name
        end 
    end 

    def self.all 
        @@all 
    end



end