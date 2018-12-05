class MontanaResortSnowfall::Scraper

  
  def self.scrape_resorts
    index_page = Nokogiri::HTML(open("http://www.skicentral.com/montana-skireport.html"))
    binding.pry
  
  arrray_of_resorts = index.page.css("div.")
  
  array_of_resorts.each do |resort_description|
    attributes = 
    {
      resort_name:  ,
      elevation:  ,
      
    }
   Resort.new(attributes) 
  end

 # def get_page
    #Nokogiri::HTML(open("http://www.skicentral.com/montana-skireport.html"))
  #end

  def scrape_resorts_index
     self.get_page.css("div#t1-50 li")
  end

  def make_resorts
    scrape_resorts_index.each do |r|
      MontanaResortSnowfall::Resort.new_from_index_page(r)
    end
  end
end