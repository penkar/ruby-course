# YOU WILL BE WRITING ALL THESE SPECS YOURSELF
# require 'spec_helper'
require_relative '../exercises.rb'

describe Exercises do
  it "triples the length of a string" do
    result = Exercises.ex0("ha")
    expect(result).to eq("hahaha")
  end

  it "returns 'nope' if the string is 'wishes'" do
    result = Exercises.ex0("wishes")
    expect(result).to eq("nope")
  end
end

describe 'Exercise 1' do
  it "Returns the number of elements in the array" do
    result = Exercises.ex1([])
    expect(result).to eq(0)
  end

  it "Returns the number of elements in the arrray." do
    result = Exercises.ex1([1,2,3,4])
    expect(result).to eq(4)
  end
end

describe 'Exercise 2' do
  it "Returns the number of elements in the array" do
    result = Exercises.ex2([1,2,3])
    expect(result).to eq(2)
  end

  it "Returns the number of elements in the arrray." do
    result = Exercises.ex2([])
    expect(result).to eq(nil)
  end
end

describe 'Exercise 3' do
  it "Returns the sum of the given array of numbers." do
    result = Exercises.ex3([])
    expect(result).to eq(0)
  end

  it "Returns the sum of the given array of numbers." do
    result = Exercises.ex3([1,2,3,4])
    expect(result).to eq(10)
  end
end

describe 'Exercise 4' do
  it "Returns the max number of the given array." do
    result = Exercises.ex4([100,1,2,3,-5])
    expect(result).to eq(100)
  end

  it "Returns the max number of the given array." do
    result = Exercises.ex4([1,2,3,4])
    expect(result).to eq(4)
  end

  it "Returns the max number of the given array." do
    result = Exercises.ex4([])
    expect(result).to eq(nil)
  end
end

describe 'Exercise 5' do
  it "Iterates through an array and `puts` each element" do
    result = Exercises.ex5([])
    expect(result).to eq([])
  end

  it "Iterates through an array and `puts` each element" do
    result = Exercises.ex5([1,2,3,4])
    expect(result).to eq([1,2,3,4])
  end
end

describe 'Exercise 6' do
  it "Updates the last item in the array to 'panda'/'Godzilla'" do
    result = Exercises.ex6([1,2,3,4])
    expect(result).to eq([1,2,3,'panda'])
  end

  it "Updates the last item  in the array to 'panda' / 'Godzilla'" do
    result = Exercises.ex6([1,2,3,'panda'])
    expect(result).to eq([1,2,3,'GODZILLA'])
  end
end

describe 'Exercise 7' do
  it "If the string `str` exists in the array add `str` to the end of the array" do
    result = Exercises.ex7([1,'panda hat',2,3,4],'panda hat')
    expect(result).to eq([1,4,2,3,'panda hat'])
  end

  it "If the string `str` exists in the array add `str` to the end of the array" do
    result = Exercises.ex7([1,2,3,'panda'],'hat')
    expect(result).to eq([1,2,3,'panda'])
  end
end

describe 'Exercise 8' do
  # it "Iterate through a hash and print out two separate values." do
  #   people = [alan={name:'Alan Wake',occupation:'Write'},audie={name:'Audie Murphy',occupation:'American Hero'}]

  #   result = Exercises.ex8(people)
  #   expect(result).to eq([1,4,2,3,'panda hat'])
  # end

  it "Iterate through a hash and print out two separate values." do
    people = [alan={name:'Alan Wake',occupation:'Write'},audie={name:'Audie Murphy',occupation:'American Hero'}]
    result = Exercises.ex8(people)
    expect(result).to eq('Audie Murphy is content making a living as an American Hero.')
  end

  it "Iterate through a hash and print out two separate values." do
    people = [alan={name:'Alan Wake',occupation:'Write'},audie={name:'Audie Murphy',occupation:'American Hero'}]
    result = Exercises.ex8(people)
    expect(result.class).to eq(String)
  end
end

describe 'Exercise 9' do
  it "Returns `true` if the given time is in a leap year, otherwise, returns `false`." do
    result = Exercises.ex9(2000)
    expect(result).to eq(true)
  end
  it "Returns `true` if the given time is in a leap year, otherwise, returns `false`." do
    result = Exercises.ex9(2004)
    expect(result).to eq(true)
  end
  it "Returns `true` if the given time is in a leap year, otherwise, returns `false`." do
    result = Exercises.ex9(1999)
    expect(result).to eq(false)
  end
  it "Returns `true` if the given time is in a leap year, otherwise, returns `false`." do
    result = Exercises.ex9(1996)
    expect(result).to eq(true)
  end
  it "Returns `true` if the given time is in a leap year, otherwise, returns `false`." do
    result = Exercises.ex9(1995)
    expect(result).to eq(false)
  end
  it "Returns `true` if the given time is in a leap year, otherwise, returns `false`." do  
    result = Exercises.ex9(1000)
    expect(result).to eq(false)
  end
  it "Returns `true` if the given time is in a leap year, otherwise, returns `false`." do
    result = Exercises.ex9(3000)
    expect(result).to eq(false)
  end
  it "Returns `true` if the given time is in a leap year, otherwise, returns `false`." do
    result = Exercises.ex9(4000)
    expect(result).to eq(true)
  end
  it "Returns `true` if the given time is in a leap year, otherwise, returns `false`." do  
    result = Exercises.ex9(5000)
    expect(result).to eq(false)
  end
end

describe 'Exercise 10' do
  it "Returns Happy hour if it is between 4 and 6 pm. Other wise returns normal prices." do
    @time_now = Time.parse(2014,1,1,17)
    time1 = Exercises.ex10
    expect(time1).to eq("Happy Hour")
  end
  it "Returns Happy hour if it is between 4 and 6 pm. Other wise returns normal prices." do
    time1 = Exercises.ex10
    expect(time1).to eq()
  end
  it "Returns Happy hour if it is between 4 and 6 pm. Other wise returns normal prices." do
    time1 = Exercises.ex10
    expect(time1).to eq()
  end
  it "Returns Happy hour if it is between 4 and 6 pm. Other wise returns normal prices." do
    time1 = Exercises.ex10
    expect(time1).to eq()
  end
  it "Returns Happy hour if it is between 4 and 6 pm. Other wise returns normal prices." do
    time1 = Exercises.ex10
    expect(time1.class).to eq(String)
  end
end

#   it "Iterate through a hash and print out two separate values." do
#     result = Exercises.ex10([1,2,3,'panda'],'hat')
#     expect(result).to eq([1,2,3,'panda'])
#   end
# end

