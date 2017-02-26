class H4ck3rReader::CLI

  def start_cli
    H4ck3rReader::Scraper.new.make_headlines
    list_headlines
  end

  def list_headlines
    puts ""
    puts "--------------------------------------------"
    puts "Welcome to the H4ck3r Reader for Hacker News"
    puts "--------------------------------------------"
    @headlines = H4ck3rReader::Headlines.all
    @headlines.each do |headline|
      puts "#{headline.rank} #{headline.title} from #{headline.site}"
      puts "Full Web Address: #{headline.url}\n\n"
    end
    puts "--------------------------------------------"
  end
end
