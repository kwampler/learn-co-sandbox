require 'pry'
require 'Nokogiri'
class Scraper

  def get_page
    Nokogiri::HTML(open("http://www.skicentral.com/montana-skireport.html"))
    binding.pry
  end

  def self.scrape_index_page
    students = []
    html = open(index_url)
    index = Nokogiri::HTML(html)
    index.css().each do |student|
      student_details = {}
      student_details[:name] = student.css("h4.student-name").text
      student_details[:location] = student.css("p.student-location").text
      profile_path = student.css("a").attribute("href").value
      student_details[:profile_url] = './fixtures/student-site/' + profile_path
      students << student_details
    end
    students
  end

  def scrape_resorts_index
     self.get_page.css("div#t1-50 li")
  end

  def make_resorts
    scrape_resorts_index.each do |r|
      MontanaSkiResorts::Resort.new_from_index_page(r)
    end
  end
end