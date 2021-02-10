#handles all interaction with user

class CLI 

    def call
        puts ""
        puts "Welcome to the charity search app!"
        puts "Please enter your zipcode to find charitable causes in your area"
        puts "To exit the app, enter 'exit'"
        puts ""
        menu
    end

    def menu
        
        API.getting_zipcode

        #input = gets.strip
        if input == "zipcode"
            puts "zipcode"
            zipcode_list
        elsif input == "exit"
            puts "exit"
        else
            puts "Oops! Invalid entry, please try again"
            menu
        end

    end

    def zipcode_list
        puts ""
        puts "Here is the list of charities in your zipcode"
        puts "Would you like more information on these charities?"
        puts "Please enter 'yes', or 'exit'"
        puts ""
        second_menu
    end

    def second_menu
        second_input = gets.strip.downcase

        if second_input == "yes"
            puts "more information"
        else second_input == "exit"
            puts "Thank you for stopping by! Goodbye :)"
        end

    end


end
