class YieldFarmer::InterestProducts
    
    attr_accessor :coin, :exchange, :rate

    @@all =[]

    def initialize(coin,exchange,rate=nil)
       @coin = coin 
       @exchange = exchange
       @rate = rate
       YieldFarmer::InterestProducts.all<<self  
    end

    def self.add_product(coin,exchange,rate)
        YieldFarmer::InterestProducts.new(coin,exchange,rate)
    end

    def self.all 
        @@all 
    end

    def self.select_coin(coin)
        YieldFarmer::InterestProducts.all.select{|product| product.coin.name == coin}
    end 



end
