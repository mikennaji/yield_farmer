class YieldFarmer::CLI

    attr_accessor :input

def call
    hello
    menu
end 

def hello
    puts"hello" 
end




def menu
    puts "Welcome farmer!"
    puts "do you want to borrow or lend"
    input = gets.strip
    while input!="lend" || input !="borrow"
      puts "Please enter a valid entry"
       input = gets.chomp
      puts input
      break if input=="lend" || input =="borrow"
    end
    if input == "lend"
        puts"Which coin would you like to farm today?"
         puts "List of coins"
         puts "if coin is selected"
         puts "view rates for coin and exchange listed on"
         puts "based on selection send person to website to lend"
    elsif input== "borrow"
         puts"list of coins"
         puts "if coin is selcted"
         puts "view rates for coin and exchange list on"
         puts "based on selection send person to website to lend"
 
     else
         puts "enter a valid entry"
     end
end


end 
