class API


    def self.getting_zipcode(zip)
        response = RestClient.get("http://data.orghunter.com/v1/charitysearch?user_key=f3fcb8bcb50c531df9b42dddb70e940b&zipCode=#{zip}")
        data_array = JSON.parse(response.body)["data"]
        if data_array == []
            return nil
        end
        data_array.each do |data| 
            Charity.new(data)
        end


        #uncoded_data = response["data"].values_at(0, 1, 2, 3)

        #charityName = uncoded_data.map do |hash| 
           # hash.select do |key,value|
              #  ["charityName"].include? key
         #   end
       # end
        
       

    end

end