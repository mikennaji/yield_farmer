class YieldFarmer::InterestProducts
    
    attr_accessor :coin, :exchange, :rate

    @@all =[]

    def initialize(coin,exchange,rate=nil)
       @coin = coin 
       @exchange = exchange
       @rate = rate
       YieldFarmer::InterestProducts.all<<self  
    end

    def self.all 
        @@all 
    end


end
