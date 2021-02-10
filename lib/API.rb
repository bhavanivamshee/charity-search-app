class API

    @@api_key = "f3fcb8bcb50c531df9b42dddb70e940b"

    def self.getting_zipcode
        zip_url = 'http://data.orghunter.com/v1/charitysearch?user_key=f3fcb8bcb50c531df9b42dddb70e940b&zipCode=74133'
        response = HTTParty.get(zip_url)
        binding.pry
    end

end