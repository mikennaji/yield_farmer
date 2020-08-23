
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
        YieldScraper::Scraper.exchanges << exchange.text 
    end 
    doc.css(".rate-cell").each do |rate|
        YieldScraper::Scraper.rates<< rate.text
    end
    doc.css("div.symbol-content span.name").each do |coin|
        YieldScraper::Scraper.coins<<coin.text 
    end
 
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


def self.add_coins
    self.coins.each do |coin|
        YieldScraper::Coin.add_coin(coin)
    end
end 

def self.add_exchanges
    self.exchanges.each do |exchange|
        YieldScraper::Exchange.add_Exchange(exchange)
    end

end



end