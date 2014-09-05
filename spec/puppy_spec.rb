require_relative 'spec_helper.rb'
require 'pry-byebug'

describe PuppyBreeder::Puppy do
  it 'Should create puppy with correct attributes.' do
    a = PuppyBreeder::Puppy
    b = a.new('pit')
    c = a.new('mix')

    expect(b.breed).to eq('pit')
    expect(b.name).to eq('spot')
    expect(b.status).to eq('available')
    expect(c.breed).to eq('mix')  
    expect(c.name).to eq('spot')  
  end
end


describe PuppyBreeder::Repos::Dog do
  it 'Should initialize an instance of a puppy.' do
    PuppyBreeder.puppy_repo.drop_tables
    dog_p = PuppyBreeder::Puppy.new('mix','spot',1)
    dog_r = PuppyBreeder.puppy_repo.create_dog('mix','spot',1)
    expect(PuppyBreeder.puppy_repo.log.count).to eq(1)
  end

  it 'Shelter should be able to check breed and cost.' do
    doga = PuppyBreeder.puppy_repo.create_dog('pitbull','spot',1)
    dogb = PuppyBreeder.puppy_repo.create_dog('pitbull','spot',1)

    expect(PuppyBreeder.puppy_repo.available_by_breed('mix').count).to eq(1)
    expect(PuppyBreeder.puppy_repo.available_by_breed('pitbull').count).to eq(2)
    expect(PuppyBreeder.puppy_repo.cost?(1)).to eq("$100.00")
    expect(PuppyBreeder.puppy_repo.cost?(2)).to eq("$300.00")
  end

  it 'Should be able to fill do orders. =true' do
    dog4 = PuppyBreeder.puppy_repo.create_dog('pitbull','spot',1)
    dog5 = PuppyBreeder.puppy_repo.create_dog('pinata','spot',1)
    PuppyBreeder.puppy_repo.fill_order(2,2)
    expect(PuppyBreeder.puppy_repo.show_adopted.count).to eq(1)
    expect(PuppyBreeder.request_repo.completed_list.count).to eq(3)
  end

end