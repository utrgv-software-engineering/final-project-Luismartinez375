 require 'rails_helper'

RSpec.describe Grade, type: :model do
  it "requires a student id to be valid" do
    grade = Grade.new(student_name: "Fred Flinstone", student_grade: 20)
    expect(grade).to be_invalid
  end

  it "requires a student name to be valid" do
    grade = Grade.new(student_id: "111222", student_grade: 100)
    expect(grade).to be_invalid
  end

  it "requires a grade to be valid" do
    grade = Grade.new(student_id: "147645", student_name: "Johah Hill")
    expect(grade).to be_invalid
  end

  it "is valid when given a valid student id, valid student name, and valid grade" do
    grade = Grade.new(student_id: "123456", student_name: "Bobby Flay", student_grade: 100)
    expect(grade).to be_valid
  end

  it "requires the grade to be greater than or equal to 0" do
    grade = Grade.new(student_id: "184848", student_name: "Joe Exotic", student_grade: -30)
    expect(grade).to be_invalid
  end
  it "requires the grade to be less than or equal to 100" do 
    grade = Grade.new(student_id: "123457", student_name: "Joe Mama", student_grade: 110)
    expect(grade).to be_invalid 
  end
  it "requires the grade to be exactly 6 characters long" do
    grade = Grade.new(student_id: "78945", student_name: "Mike Oxlong", student_grade: 55)
    expect(grade).to be_invalid
  end
end
  
