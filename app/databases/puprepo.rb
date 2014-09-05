module PuppyBreeder
  module DogRepo
    class Dog
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
          age int
          )
        ])
      end

      def log
        result = @db.exec("SELECT * FROM dogs")
        built_requests = (result.entries)
      end

      def show_available
        result = @db.exec(%q[
          SELECT * FROM dogs WHERE status = 'available';
        ])
        build_request(result.entries)
      end

      def show_adopted
        result = @db.exec(%q[
          SELECT * FROM dogs WHERE status = 'adopted';
        ])
        build_request(result.entries)
      end

      def create_dog(dog)
        @db.exec(%q[
          "INSERT INTO dogs (id,breed,status,name,age) 
          VALUES( $1, $2 $3 $4 $5 );
          ],[dog.id, dog.breed, dog.status, dog.name, dog.age)
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