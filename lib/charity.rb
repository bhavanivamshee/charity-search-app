class Charity

    @@all = []

    attr_accessor :charityName, :url, :category, :missionStatement, :city

    def initialize(hash)
        hash.each do |k, v|
        self.send(("#{k}="), v) if self.respond_to?(("#{k}="))
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end 

    def self.find_by_name(charityName)
        self.all.select do |charity|
            charity.charityName == charityName
        end
    end
    
end
