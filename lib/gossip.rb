require 'csv'

class Gossip
    attr_accessor :author, :content

    def initialize(author, content)
        @author = author
        @content = content
    end

    # Save the gossips in a csv file
    def save
        CSV.open("db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
        end
    end

    # Find all gossips by their index 
    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
            all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
    return all_gossips
    end

    # Find a gossip by its id with select method who take each elements of self
    def self.find(id)
        select = []
        Gossip.all.each do |id|
            select << id
        end
        select[id]
    end
end