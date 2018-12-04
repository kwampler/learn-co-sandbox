class MontanaResortSnowfall::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.skicentral.com/montana-skireport.html"))
  end

  def scrape_resorts_index
     self.get_page.css("div#t1-50 li")
  end

  def make_resorts
    scrape_resorts_index.each do |r|
      MontanaResortSnowfall::Resort.new_from_index_page(r)
    end
  end
end