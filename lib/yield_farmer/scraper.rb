


class YieldFarmer::Scraper
     attr_accessor :url,:coins,:exchanges,:rates
    
     @@coins =[]
     @@exchanges =[]
     @@rates =[]
 


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



end