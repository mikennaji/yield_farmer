


class YieldFarmer::Scraper
     attr_accessor :url,:coins,:exchanges,:rates,:divy_rates
    
     @@coins =[]
     @@exchanges =[]
     @@rates =[]
     @@divy_rates = []
    
 

def url
   html =open("https://defirate.com/lend/")
    doc = Nokogiri::HTML(html)
    self.rates =[]
    self.exchanges = []
    self.coins =[]
    doc.css(".token-cell span.name").each do |exchange|
        self.exchanges << exchange.text 
    end 
    doc.css(".rate-cell").each do |rate|
        self.rates<< rate.text
    end
    doc.css("div.symbol-content span.name").each do |coin|
        self.coins<<coin.text 
    end

 
end
     
def divy_rates
    array = self.rates.each_slice(12).to_a
    array 
end


def  self.rates 
    @@rates
end 

def self.exchages 

    @@exchanges 
end 

def self.coins 
    @@coins
end 


def add_coins
    self.coins.each do |coin|
        YieldFarmer::Coin.add_coin(coin) 
    end
end 

def add_exchanges
    self.exchanges.each do |exchange|
      YieldFarmer::Exchange.add_Exchange(exchange)
    end

end

def add_rates
    

 
                   divy_rates.each_with_index do |rate_for_coin,index|
                    rate_for_coin.zip(YieldFarmer::Exchange.all).each do |rate,exchange|
                    break if YieldFarmer::Coin.all[index] == nil   
                    YieldFarmer::InterestProducts.new(YieldFarmer::Coin.all[index],exchange,rate)
                    
                    
                end
             end
end

def coin_offerings
    @coin_offerings ={}
    YieldFarmer::Coin.all.each_with_index do |val, idx|
        @coin_offerings[idx]= YieldFarmer::InterestProducts.select_coin(val.name)
    end
    @coin_offerings


end
    
    




end