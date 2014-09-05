#Refer to this class as PuppyBreeder::PurchaseRequest
module PuppyBreeder
  class PurchaseRequest
    @@counter = 1
    attr_accessor :request_id, :status, :breed

    def initialize(breed)
      @request_id = @@counter
      @@counter += 1
      @status = 'pending'
      @breed = breed
    end
  end



  class RequestRepository
    @@counter = 1
    @@list = Hash.new
    attr_accessor :number

    def self.list(breed=false,status=false)
      if breed && status
        result = @@list.select {|x,y| y.status==status}
        result2 = @@list.select {|x,y| y.breed==breed}
        return result2
      end
      if breed
        result = @@list.select {|x,y| y.breed==status}
        return result
      end
      if status
        result = @@list.select {|x,y| y.status==status}
        return result
      end
      @@list
    end

    def self.add_request(request)
      @number = @@counter
      @@list[@number] = request
      @@counter += 1
    end

    def self.create_request(breed='mix')
      request = PurchaseRequest.new(breed)
      self.add_request(request)
    end

    def self.complete_request(request_id)
      @@list[request_id].status = 'complete'
    end

    def self.completed_list
      list(false,'complete')
    end

    def self.end_request(request_id)
      @list[request_id].status = 'ended'
    end

    def self.deny_list
      list(false,'denied')
    end

    def self.pending_requests
      list(false,'pending')
    end

    def self.breed_requested(request_id)
      @@list[request_id].breed      
    end

    def self.hold_request(request_id)
      @@list[request_id].status = 'hold'      
    end

    def self.hold_to_pending(request_id)
      @@list[request_id].status = 'pending'      
    end

    def self.pending_list_kick(breed)
      reconsider = list(breed,'pending')
      reconsider.each {|x,y| hold_to_pending(x)}
    end
  end
end