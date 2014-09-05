require_relative 'spec_helper.rb'



describe PuppyBreeder::PurchaseRequest do
  it 'Creates a Puppy Request. Note tables dropped in next describe to allow Puppy Rec to pass.' do 
    a = PuppyBreeder::PurchaseRequest
    b = PuppyBreeder::PurchaseRequest.new('mix')
    expect(b.request_id).to eq(4)
    expect(b.breed).to eq('mix')
    expect(b.status).to eq('pending')
    c = PuppyBreeder::PurchaseRequest.new('mix')
    expect(c.request_id).to eq(5)
  end
end


describe PuppyBreeder::Repos::Request do
  it 'Should allow request repo to create requests.' do
    PuppyBreeder.request_repo.drop_tables
    PuppyBreeder::Repos::Request
    req1 = PuppyBreeder.request_repo.create_request('pitbull')
    expect(PuppyBreeder.request_repo.log.count).to eq(1)
    expect(PuppyBreeder.request_repo.breed_requested(1)).to eq('pitbull')
    PuppyBreeder.request_repo.create_request
    expect(PuppyBreeder.request_repo.log.count).to eq(2)
  end

  it 'Be ale to list pending requests.' do
    PuppyBreeder.request_repo.create_request
    PuppyBreeder.request_repo.create_request
    expect(PuppyBreeder.request_repo.log.count).to eq(4)
  end

  it 'Should generate list of completed requests.' do
    PuppyBreeder.request_repo.complete_request(3)
    PuppyBreeder.request_repo.complete_request(4)
    expect(PuppyBreeder.request_repo.completed_list.count).to eq(2)
  end

  it 'Pending List should populate when hold requested used. New puppy instance of held breed will kick a reminder to the Shelter.' do
    PuppyBreeder.request_repo.create_request('pinata')
    PuppyBreeder.request_repo.hold_request(5)
    expect(PuppyBreeder.request_repo.held_list.count).to eq(1)
    PuppyBreeder.puppy_repo.create_dog('pinata','spot',1)
    expect(PuppyBreeder.request_repo.held_list.count).to eq(0)
  end

  it 'Should be able to end orders. =false' do
    PuppyBreeder.request_repo.end_request(1)
    expect(PuppyBreeder.request_repo.ended_list.count).to eq(1)
  end

end
