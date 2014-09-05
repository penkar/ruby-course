#Refer to this class as PuppyBreeder::Puppy
require 'pry-byebug'
module PuppyBreeder
  class Puppy
    # @@counter = 1
    attr_accessor :status, :breed, :id, :name, :age

    def initialize(breed='mix',name="spot", age='unknown')
      # @id = @@counter
      # @@counter +=1
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
