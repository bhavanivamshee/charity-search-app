#handles all interaction with user

class CLI 

    def call
        puts ""
        puts "Welcome to the charity search app!"
        puts ""
        self.first_menu
    end

    def first_menu
        puts ""
        puts "Please enter your zipcode to find charitable causes in your area"
        puts ""
        input = gets.strip
        zipcode_check = API.getting_zipcode(input)
        if zipcode_check 
        zipcode
        else 
            puts "That zipcode was invalid"
            first_menu
        end
    end

    def zipcode
            puts "Here is a list of charities in your zipcode"
           Charity.all.each_with_index do |charity, index|
                puts "#{index +1}. #{charity.charityName}"
            end
            puts ""
        zipcode_list
    end

    def zipcode_list
        puts ""
        puts "Would you like more information on these charities?"
        puts "Please enter the name of the charity"
        puts ""
        second_input = gets.strip.upcase
        charity_array = []
        Charity.all.each do |charity|
            charity_array << "#{charity.charityName}"
        end

        if charity_array.include? second_input
        charity_details(second_input)
        else 
            puts "Invalid entry, please enter a charity name."
            zipcode_list
        end
    end

     def charity_details(charity)
       more_info = Charity.find_by_name(charity)
       more_info.each do |i|
        puts "Name: #{i.charityName}"
        puts "URL: #{i.url}"
        puts "Category: #{i.category}"
        puts "Mission Statement: #{i.missionStatement}"
        puts "City: #{i.city}"
       end
       second_menu
    end

    def second_menu
        puts ""
        puts "I hope you found the information you were looking for!"
        puts "Please enter the number of an option below"
        puts "1. I want to check another zipcode"
        puts "2. I want to get more information on a charity in my zipcode"
        puts "3. I would like to exit"
        puts ""
        third_input = gets.strip
        final_menu(third_input)
    end

    def final_menu(number)
        if number == "1"
            first_menu
        elsif number == "2"
            zipcode
        else number == "3"
            puts ""
            puts "Thank you for using the charity search app! Have a nice day :)"
            puts ""
            exit
        end
    end

end
