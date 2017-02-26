class H4ck3rReader::CLI

  def call
    H4ck3rReader::Scraper.new.make_headlines
    start
  end

  def start
    puts ""
    puts "--------------------------------------------"
    puts "Welcome to the H4ck3r Reader for Hacker News"
    puts "--------------------------------------------"
    puts ""
    puts "Which number of headlines by rank would you like to see from 1-30 (it lists five headlines from the number)."
    input = gets.strip.to_i
    if input >= 1 && input <= 30
      list_headlines(input)
    else
      unless input >= 1 && input <= 30
        endputs "Please type in a correct headline number."
        input = gets.strip.to_i
      end
    end

    puts "Would you like to view a different number of headlines by rank? Enter Y or N."
    input = gets.strip.downcase
    if input == 'y'
      start
    else
      puts "\n\nThank you! Have a nice day!"
      exit
    end
  end

  def list_headlines(start_number)
    @headlines = H4ck3rReader::Headlines.all[start_number-1, 5]
    @headlines.each do |headline|
      puts "\n\n#{headline.rank} \"#{headline.title}\" from the site: #{headline.site}"
      puts "Full Web Address: #{headline.url}"
    end
    puts "--------------------------------------------"
  end
end
