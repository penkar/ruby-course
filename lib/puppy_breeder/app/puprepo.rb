module PuppyBreeder
  module Repos
    class Dog
      @@cost = {'mix'=>100,'pitbull'=>300,'pinata'=>50}
      def initialize
        @db = PG.connect(host: "localhost",dbname: "dogproject")
        build_tables
      end

      def build_tables
        @db.exec(%q[
        CREATE TABLE IF NOT EXISTS dogs(
          id serial,
          breed text,
          status text,
          name text,
          age int,
          cost money
          )
        ])
      end

      def drop_tables
        @db.exec("DROP TABLE dogs;")
        build_tables
      end

      def log(breed=nil,status=nil)
        sql = ''
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

        result = @db.exec("SELECT * FROM dogs " + sql)
        built_requests = (result.entries)
      end

      def available_by_breed(breed)
        log(breed)
      end

      def show_available
        log(nil,'available')
      end

      def show_adopted
        log(nil,'adopted')
      end

      def cost?(id)
        result = @db.exec(
          %q[SELECT cost FROM dogs WHERE id = $1],
          [id]
          )
        result.entries[0]["cost"]
      end

      def create_dog(breed='mix',name="spot", age='unknown')
        dog = PuppyBreeder::Puppy.new(breed,name,age)
        add_dog(dog)
      end

      def adopt(num)
        @db.exec(%q[UPDATE dogs SET (status) = ($1) WHERE id = $2],['adopted', num])
      end

      def add_dog(dog)
        @db.exec(%q[
          INSERT INTO dogs (breed,status,name,age,cost) 
          VALUES( $1, $2, $3, $4, $5 );
          ],[dog.breed, dog.status, dog.name, dog.age, @@cost[dog.breed]])
        PuppyBreeder.request_repo.kick(dog.breed)
      end

      def fill_order(request_id,puppy_id)
        PuppyBreeder.request_repo.complete_request(request_id)
        PuppyBreeder.puppy_repo.adopt(puppy_id)
      end

      def build_request(entries)
        entries.map do |dog|
          request = PuppyBreeder::Puppy.new(dog["breed"],dog["name"],dog["age"])
          request.instance_variable_set :@id, req["id"].to_i
          request.instance_variable_set :@status, req["status"].to_s
          request
        end
      end

    end
  end
end