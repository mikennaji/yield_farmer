class YieldFarmer::Exchange

    attr_accessor :name
     
     @@all = []
     
    def intialize(name)
        @name = name
        self.class.all << self
    end 

    def self.rates
        rates = YieldFarmer::InterestProducts.all.select{|product| product.exchange}
        rates.each do |good|
            puts good.rate,good.coin.name
        end 
    end 
    
    def self.all 
        @@all 
    end 


    






end