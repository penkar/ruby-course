#Refer to this class as PuppyBreeder::Puppy
require 'pry-byebug'
module PuppyBreeder
  class Puppy
    @@counter = 1
    attr_accessor :status, :breed, :id, :name, :age

    def initialize(breed='mix',name="spot", age='unknown')
      @id = @@counter
      @@counter +=1
      @status = 'available'
      @breed = breed
      @name = name
      @age = age
    end

    def adopt
      @status == 'adopted'
    end
  end
end


  # class DogShelter
  #   @@costhash={'pinata'=>50,'shepard'=>5000,'pitbull'=>300,'golden retrierver'=>400,'mix'=>200,'ultra rare breed'=>1000,'lab'=>500}
  #   @@counter =1
  #   @@doglist = {}

  #   def self.doglist(breed=false,status=false)
  #     if breed && status
  #       result = @@doglist.select {|x,y| y.breed==breed}
  #       result2 = @@doglist.select {|x,y| y.status==status}
  #       return result2
  #     end
  #     if breed
  #       result = @@doglist.select {|x,y| y.breed==breed}
  #       return result
  #     end
  #     if status
  #       result = @@doglist.select {|x,y| y.status==status}
  #       return result
  #     end
  #     @@doglist
  #   end

  #   def add_breed_cost(breed,cost)
  #     @@costhash[breed]=cost
  #   end

  #   def self.add_dog(dog)
  #     @@doglist[@@counter] = dog
  #     @@counter += 1
  #     PuppyBreeder::RequestRepository.pending_list_kick(dog.breed)
  #   end

  #   def self.create_dog(breed)
  #     dog = Puppy.new(breed)
  #     add_dog(dog)
  #   end

  #   def self.cost?(id_number)
  #     @@costhash[@@doglist[id_number].breed]
  #   end

  #   def self.available_by_breed(breed)
  #     doglist(breed,'available')
  #   end

  #   def self.adopt(dog_id)
  #     doglist[dog_id].status = 'adopted'
  #   end

  #   def self.adopted_list
  #     doglist(false,'adopted')
  #   end

  #   def self.fill_dog_order(request_id,dog_id,condition=true)
  #     if condition
  #       RequestRepository.complete_request(request_id)
  #     else
  #       RequestRepository.end_request(request_id)
  #     end
  #     return doglist[dog_id].name
  #   end

  #   def self.first_avail_dog_breed(request_id)
  #     breed = RequestRepository.breed_requested(request_id)
  #     matches = doglist.select {|x,y| (y.breed == breed && y.status == 'available')}
  #     dog_id =  matches.keys[0]
  #     fill_dog_order(request_id,dog_id)
  #   end

  #   def self.hold_request(request_id)
  #     RequestRepository.hold_request(request_id)      
  #   end

  # end
# end