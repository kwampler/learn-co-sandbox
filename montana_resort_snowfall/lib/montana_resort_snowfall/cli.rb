
class MontanaResortSnowfall::CLI

  def call
    MontanaResortSnowfall::Scraper.new.make_snowfall
    puts "Want to shred the Nar Nar?  Checkout who has the Pow Pow!"
    start
  end

  def start
    puts "How many resorts would you like to see ranked?  The top 1-5, the top 1-10, or the top 1-20?"
    input = gets.strip.to_i

    print_snowfall(input)

    puts ""
    puts "What resort would you like more information on?"
    input = gets.strip

    resort = MontanaResortSnowfall::Resort.find(input.to_i)

    print_resort(resort)

    puts ""
    puts "Would you like to see snowfall from another resort? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you! Have a great day!"
      exit
    else
      puts ""
      puts "I don't understand that answer."
      start
    end
  end

  def print_resort
    puts ""
    puts "----------- #{resort.name} - #{resort.position} -----------"
    puts ""
    puts "Location:           #{resort.location}"
    #shouldn't it print the name of the resort? puts "Name"
    puts "Zipcode:          #{resort.zipcode}"#or town name
    puts "Elevation:      #{resort.elevation}"
    puts ":Ticket Price      #{resort.ticket_price}"
    puts "Website:            #{restaurant.website_url}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#resort.description}"
    puts ""
  end

  def print_snowfall(from_number)
    puts ""
    #in inches puts "---------- Snowfall #{from_number} - #{from_number+9} ----------"
    puts ""
    MontanaResortSnowfall::Resort.all[from_number 1, 10].each.with_index(from_number) do |resort, index|
      puts "#{index}. #{resort.name} - #{resort.location}"
    end
  end

end