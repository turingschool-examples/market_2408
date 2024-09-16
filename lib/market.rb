class Market

    attr_reader :name, :vendors
    attr_accessor :add_vendor

    def initialize(name)
        @name = name
        @vendors = []
    end

    def add_vendor(vendor)
        @vendors << vendor
    end
 

end
