
class YieldFarmer::Scraper
     attr_accessor :url,:coins,:exchanges,:rates
    
 


def url
   html =open("https://defirate.com/lend/")
    doc = Nokogiri::HTML(html)
    @rates =[]
    @exchanges = []
    @coins =[]
    doc.css(".token-cell span.name").each do |exchange|
        exchanges << exchange.text 
    end 
    doc.css(".rate-cell").each do |rate|
       rates<< rate.text
    end
    doc.css("div.symbol-content span.name").each do |coin|
        coins<<coin.text 
    end
    return @rates, @exchanges, @coins  
     
end

def add_coins
    @coins.each do |coin|
        YieldFarmer::Coin.add_coin(coin)
    end
end 

end

