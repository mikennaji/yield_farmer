


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
        @coin_offerings[val.name]= YieldFarmer::InterestProducts.select_coin(val.name)
    end
    @coin_offerings


end
    
def make_table_for_coins
    @store = {}
self.coin_offerings.each_with_index do |(k, v), i|
    p k, v, i
        
       

        @store[k] = Terminal::Table.new :headings => ['Coin','Exchange','Rate'] do |t|
            v.each do  |product|
            if product.rate != "–"
            t<< [product.coin.name,product.exchange.name,product.rate.colorize(:green)]
            else  
            t<< [product.coin.name,product.exchange.name,product.rate]
            end
        end 
        
    end
end 
@store
    

end

def make_menu
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('Yield Farmer').colorize(:green)
     puts "\n\n\n" 
     puts self.render_ascii_art
     puts "\n\n\n"   
     puts "Which coin do you want to farm?".colorize(:green)
     puts "\n\n" 
    self.coin_offerings.each_with_index do |(k, v), i|
        puts "#{i+1}. #{k}"
    end
    input = gets.strip.to_i 
    answer=self.coins[input-1]
    return puts @store[answer]


end

def render_ascii_art
    File.readlines("farmer.txt") do |line|
      puts line
    end
  end

end