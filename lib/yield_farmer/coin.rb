class YieldFarmer::Coin 
    
    attr_accessor :name
   
    @@all = []
     
    def initialize(name)
      @name = name
      self.class.all<<self
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

    def self.add_coin(name)
        if  YieldFarmer::Coin.all.detect{|coin| coin.name == name}
            return nil 
        else  
            YieldFarmer::Coin.new(name)
        end 
    end 



end