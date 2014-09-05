# we initialize the module here to use in our other files
module PuppyBreeder
  def self.request_repo=(x)
    @request_repo = x
  end

  def self.request_repo
    @request_repo
  end

    def self.puppy_repo=(x)
    @puppy_repo = x
  end

  def self.puppy_repo
    @puppy_repo
  end
end

require 'pg'
require_relative 'puppy_breeder/puppy.rb'
require_relative 'puppy_breeder/purchase_request.rb'
require_relative 'puppy_breeder/app/reqrepo.rb'
require_relative 'puppy_breeder/app/puprepo.rb'

PuppyBreeder.request_repo= PuppyBreeder::Repos::Request.new
PuppyBreeder.puppy_repo = PuppyBreeder::Repos::Dog.new