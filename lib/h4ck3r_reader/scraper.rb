
class H4ck3rReader::Scraper

  def get_page
    Nokogiri::HTML(open("https://news.ycombinator.com/"))
  end

  def scrape_homepage
    self.get_page.css("table.itemlist tr.athing")
  end

  def make_headlines
    scrape_homepage.each do |article|
      H4ck3rReader::Headlines.new_from_homepage(article)
  #    binding.pry
    end
  end

end
