module PuppyBreeder
  module ReqRepo
    class Request
      def initialize
        @db = PG.connect(host: "localhost",dbname: "dogproject")
        build_tables
      end

      def build_tables
        @db.exec(%q[
        CREATE TABLE IF NOT EXISTS request(
          id serial,
          breed text,
          status text
          )
        ])
      end

      def log
        result = @db.exec("SELECT * FROM request")
        built_requests = (result.entries)
      end

      def create_request(request)
        @db.exec(%q[
          "INSERT INTO requests  (id,status,breed) 
          VALUES( $1, $2 $3);
          ],[request.id,request.status,request.breed])
      end

      def show_accepted
        result = @db.exec(%q[
          SELECT * FROM request WHERE status = 'accepted';
        ])
        build_request(result.entries)
      end

      def show_pending
        result = @db.exec(%q[
          SELECT * FROM request WHERE status = 'pending';
        ])
        build_request(result.entries)
      end

      # def update_request(request)
      #   @db.exec(%q[
      #     "INSERT INTO requests  (id,status,breed) 
      #     VALUES( $1, $2 $3);
      #     ],[request.id,request.status,request.breed])
      # end

      # def update_request(request)
      #   @db.exec(%q[
      #     "INSERT INTO requests  (id,status,breed) 
      #     VALUES( $1, $2 $3);
      #     ],[request.id,request.status,request.breed])
      # end

      def build_request(entries)
        entries.map do |req|
          request = PuppyBreeder::PurchaseRequest.new(req["breed"])
          request.instance_variable_set :@id, req["id"].to_i
          request.instance_variable_set :@status, req["status"].to_s
          request
        end
      end
    def 

    # @@counter = 1
    # @@list = Hash.new
    # attr_accessor :number

    # def self.list(breed=false,status=false)
    #   if breed && status
    #     result = @@list.select {|x,y| y.status==status}
    #     result2 = @@list.select {|x,y| y.breed==breed}
    #     return result2
    #   end
    #   if breed
    #     result = @@list.select {|x,y| y.breed==status}
    #     return result
    #   end
    #   if status
    #     result = @@list.select {|x,y| y.status==status}
    #     return result
    #   end
    #   @@list
    # end

    # def self.complete_request(request_id)
    #   @@list[request_id].status = 'complete'
    # end

    # def self.completed_list
    #   list(false,'complete')
    # end

    # def self.end_request(request_id)
    #   @list[request_id].status = 'ended'
    # end

    # def self.deny_list
    #   list(false,'denied')
    # end

    # def self.pending_requests
    #   list(false,'pending')
    # end

    # def self.breed_requested(request_id)
    #   @@list[request_id].breed      
    # end

    # def self.hold_request(request_id)
    #   @@list[request_id].status = 'hold'      
    # end

    # def self.hold_to_pending(request_id)
    #   @@list[request_id].status = 'pending'      
    # end

    # def self.pending_list_kick(breed)
    #   reconsider = list(breed,'pending')
    #   reconsider.each {|x,y| hold_to_pending(x)}
    # end

    #   def select_all_students
    #     results = @db.exec(%q[
    #         SELECT * FROM myfirstdb;
    #       ])
    #   end
    # end
  end
end