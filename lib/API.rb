class API


    def self.getting_zipcode(zip)
        response = RestClient.get("http://data.orghunter.com/v1/charitysearch?user_key=f3fcb8bcb50c531df9b42dddb70e940b&zipCode=#{zip}")
        puts "------------------- API data grab-------------------"
        
        data_array = JSON.parse(response.body)["data"]
        if data_array == []
            return nil
        end
        data_array.each do |data| 
            Charity.new(data)
        end
        
       

    end

end

