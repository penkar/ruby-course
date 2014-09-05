#Refer to this class as PuppyBreeder::PurchaseRequest
module PuppyBreeder
  class PurchaseRequest
    attr_accessor :id
    @@counter = 1
    attr_accessor :request_id, :status, :breed

    def initialize(breed)
      @request_id = @@counter
      @@counter += 1
      @status = 'pending'
      @breed = breed
    end

    def accept
      @status == 'accepted'
    end
    
    def deny
      @status == 'deny'
    end

    def hold
      @status == 'hold'
    end
  end
end