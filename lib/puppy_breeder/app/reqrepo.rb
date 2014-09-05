module PuppyBreeder
  module Repos
    class Request
      attr_accessor :request_id
      def initialize
        @db = PG.connect(host: "localhost",dbname: "dogproject")
        build_tables
      end

      def drop_tables
        @db.exec("DROP TABLE request;")
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

      def log(breed=nil,status=nil)
        sql = ""
        if breed || status
          if breed && status
            sql = "WHERE breed = '#{breed}' AND status = '#{status}'"
          end
          if breed
            sql = "WHERE breed = '#{breed}'"
          end
          if status
            sql = "WHERE status = '#{status}'"
          end
        end
        result = @db.exec("SELECT * FROM request " + sql)
        build_request(result.entries)
      end

      def breed_requested(request_id)
        result = @db.exec(%q[SELECT * FROM request WHERE id = $1],[request_id])
        result.entries[0]["breed"]
      end

      def create_request(breed='mix')
        request = PuppyBreeder::PurchaseRequest.new(breed)
        add_request(request)
      end

      def add_request(request)
        @db.exec(%q[INSERT INTO request (status,breed) 
          VALUES( $1, $2)
          ],[request.status,request.breed])
      end

      def completed_list
        log(nil,'completed')
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

      def complete_request(num)
        @db.exec(%q[UPDATE request SET (status) = ($1) WHERE id = $2],['completed', num])
      end

      def end_request(num)
        @db.exec(%q[UPDATE request SET (status) = ($1) WHERE id = $2],['ended', num])
      end

      def ended_list
        log(nil,'ended')
      end

      def hold_request(num)
        @db.exec(%q[UPDATE request SET (status) = ($1) WHERE id = $2],['hold', num])
      end

      def kick(breed)
        if !held_list.empty?
              held_list.each do |x| 
              if x.breed == breed
                @db.exec(%q[UPDATE request SET (status) = ($1) WHERE id = $2],['pending', x.id])
              end
          end
        end        
      end

      def held_list
        log(nil,'hold')
      end

      def req_by_breed(breed)
        log(breed)
      end

      def build_request(entries)
        entries.map do |req|
          request = PuppyBreeder::PurchaseRequest.new(req["breed"])
          request.instance_variable_set :@id, req["id"].to_i
          request.instance_variable_set :@status, req["status"].to_s
          request
        end
      end



    end
  end
end
