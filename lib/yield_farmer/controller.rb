class YieldFarmer::CLI

    attr_accessor :input

def call
    hello
    menu
end 

def hello
    puts"hello" 
end

def make_instance
    x =  YieldFarmer::Scraper.new
    x.url
    x.add_exchanges
    x.add_coins
    x.add_rates
    x.coin_offerings
    x.make_table_for_coins
    x.make_menu
end

def menu
    self.make_instance
end


end 
