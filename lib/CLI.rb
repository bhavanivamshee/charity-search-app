#handles all interaction with user

class CLI 

    def call
        puts "----------------------------------".light_magenta
        puts "Welcome to the charity search app!".light_magenta
        puts "----------------------------------".light_magenta
        self.first_menu
    end

    def first_menu
        puts ""
        puts "Please enter your zip code below to find charitable causes in your area.".light_magenta
        puts ""
        input = gets.strip
        zipcode_check = API.getting_zipcode(input)
        if zipcode_check 
        zipcode
        else 
            puts "That zip code was invalid, please try again.".red
            first_menu
        end
    end

    def zipcode
            puts ""
            puts "Here is a list of charities in your zip code:".light_magenta
            puts ""
           Charity.all.each_with_index do |charity, index|
                puts "#{index +1}. #{charity.charityName}".light_blue
            end
            puts ""
        zipcode_list
    end

    def zipcode_list
        puts ""
        puts "For more information, please enter the name of the charity".light_magenta
        puts ""
        second_input = gets.strip.upcase
        charity_array = []
        Charity.all.each do |charity|
            charity_array << "#{charity.charityName}"
        end

        if charity_array.include? second_input
        charity_details(second_input)
        else 
            puts "Invalid entry, please enter a charity name.".red
            zipcode_list
        end
    end

     def charity_details(charity)
       more_info = Charity.find_by_name(charity)
       more_info.each do |i|
        puts "Name: #{i.charityName}".light_blue
        puts "URL: #{i.url}".light_blue
        puts "Category: #{i.category}".light_blue
        puts "Mission Statement: #{i.missionStatement}".light_blue
        puts "City: #{i.city}".light_blue
       end
       second_menu
    end

    def second_menu
        puts ""
        puts "I hope you found the information you were looking for!".light_magenta
        puts "Please enter the number of an option below".light_magenta
        puts "1. I want to broaden my search to inlcude another zip code".light_blue
        puts "2. I want to get more information on a charity in my zip code".light_blue
        puts "3. I would like to exit".light_blue
        puts ""
        third_input = gets.strip
        final_menu(third_input)
    end

    def final_menu(number)
        if number == "1"
            first_menu
        elsif number == "2"
            zipcode
        elsif number == "3"
            puts "--------------------------------------------------------------".light_magenta
            puts "Thank you for using the charity search app! Have a nice day :)".light_magenta
            puts "--------------------------------------------------------------".light_magenta
            exit
        else
            puts "Oops! Invalid Entry, please try again".red
            second_menu
        end
    end

end
