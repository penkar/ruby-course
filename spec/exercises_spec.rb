# YOU WILL BE WRITING ALL THESE SPECS YOURSELF
# require 'spec_helper'
require_relative '../exercises.rb'

describe 'Exercise 0' do
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
    STDOUT.should_receive(:puts).with(1)
    STDOUT.should_receive(:puts).with(2)
    STDOUT.should_receive(:puts).with(3)
    STDOUT.should_receive(:puts).with(4)
    result = Exercises.ex5([1,2,3,4])
  end
end

describe 'Exercise 6' do
  it "Updates the last item in the array to 'panda'/'Godzilla'" do
    result0 = Exercises.ex6([1,2,3,4])
    result1 = Exercises.ex6([1,2,3,'panda'])
    expect(result0).to eq([1,2,3,'panda'])
    expect(result1).to eq([1,2,3,'GODZILLA'])
  end
end

describe 'Exercise 7' do
  it "If the string `str` exists in the array add `str` to the end of the array" do
    array1 = [1,'panda hat',2,3,4]
    array2 = [1,2,3,'panda']
    array3 = [1,2,'panda',4]
    result1 = Exercises.ex7(array1, 'panda hat')
    result2 = Exercises.ex7(array2, 'hat')
    result3 = Exercises.ex7(array3, 'hat')
    expect(result1).to eq([1,4,2,3,'panda hat'])
    expect(result2).to eq([1,2,3,'panda'])
    expect(result3).to eq([1,2,'panda',4])
  end
end

describe 'Exercise 8' do
  it "Iterate through a hash and print out two separate values." do
    people = [alan={name:'Alan Wake',occupation:'Writer'},audie={name:'Audie Murphy',occupation:'American Hero'}]
    Exercises.should_receive(:print).with("Alan Wake: Writer")
    Exercises.should_receive(:print).with("Audie Murphy: American Hero")
    Exercises.ex8(people)
  end
end

describe 'Exercise 9' do
  it "Returns `true` if the given time is in a leap year, otherwise, returns `false`." do
    result = Exercises.ex9(2000)
    expect(result).to eq(true)
    result = Exercises.ex9(2004)
    expect(result).to eq(true)
    result = Exercises.ex9(1999)
    expect(result).to eq(false)
    result = Exercises.ex9(1996)
    expect(result).to eq(true)
    result = Exercises.ex9(1995)
    expect(result).to eq(false)
    result = Exercises.ex9(1000)
    expect(result).to eq(false)
    result = Exercises.ex9(3000)
    expect(result).to eq(false)
    result = Exercises.ex9(4000)
    expect(result).to eq(true)
    result = Exercises.ex9(5000)
    expect(result).to eq(false)
  end
end

describe 'Exercise 10' do
  it "Returns Happy hour if it is between 4 and 6 pm. Other wise returns normal prices." do
    @fivepm = Time.parse('5:00 pm')
    Time.stub(:now).and_return(@fivepm)
    time1 = Exercises.ex10
    expect(time1).to eq("Happy Hour!")
    time1 = Exercises.ex10
    expect(time1.class).to eq(String)
  end
end



describe 'Extension 1' do 
  it "Takes an 'array' of strings and returns a hash with 2 keys: (:most) and (:least)." do
    array1 = [1,2,1,1,1,3,4,4,4,3,3,3,3,1,1,1,1,1,1]
    array2 = %w(the body is but a vessel of the soul. A puppet which bends to the soul's tyranny.)
    array3 = []
    result1 = Extensions.extremes(array1)
    result2 = Extensions.extremes(array2)
    result3 = Extensions.extremes(array3)
    expect(result1).to eq({most:'1',least:'2'})
    expect(result2).to eq({most:'the',least:'body'})
    expect(result3).to eq(nil)
  end
end

#   it "Iterate through a hash and print out two separate values." do
#     result = Exercises.ex10([1,2,3,'panda'],'hat')
#     expect(result).to eq([1,2,3,'panda'])
#   end
# end

