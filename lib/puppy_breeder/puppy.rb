#Refer to this class as PuppyBreeder::Puppy
require 'pry-byebug'
module PuppyBreeder
  class Puppy
    attr_accessor :status, :breed, :id, :name, :age

    def initialize(breed='mix',name="spot", age='unknown')
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
