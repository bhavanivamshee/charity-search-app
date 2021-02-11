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
        puts "To exit the app, enter 'exit'"
        puts ""
        zipcode
    end

    def zipcode

        input = gets.strip

        API.getting_zipcode(input)

            puts "Here is a list of charities in your zipcode"
            Charity.all.each_with_index do |charity, index|
                puts "#{index +1}. #{charity.charityName}"
            end
            puts ""
        zipcode_list

    end

    def zipcode_list
        puts ""
        puts "Here is the list of charities in your zipcode"
        puts "Would you like more information on these charities?"
        puts "Please enter the name of the charity, or 'exit'"
        puts ""
        second_input = gets.strip.upcase
        second_menu(second_input)
    end

    def second_menu(charity)
       more_info = Charity.find_by_name(charity)

       more_info.each do |i|
        puts "Name: #{i.charityName}"
        puts "URL: #{i.url}"
        puts "Category: #{i.category}"
        puts "Mission Statement: #{i.missionStatement}"
        puts "City: #{i.city}"
       end

        binding.pry
    end


end
