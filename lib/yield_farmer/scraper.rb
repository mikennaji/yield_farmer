
class YieldFarmer::Scraper
     attr_accessor :url

 

def url
   html =open("https://defirate.com/lend/")
    doc = Nokogiri::HTML(html)
    return doc.css("div.symbol-cell").text
    
end

end 
