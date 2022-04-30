FactoryBot.define do
  factory :grade do
    sequence(:student_id) do |n|
      string=""
      letters=('A'..'Z').to_a
      
      string+=letters[n % letters.length]
      string+=letters[n%letters.length]
      string+=letters[n%letters.length]
      string+=letters[n%letters.length]
      string+=letters[n%letters.length]
      string+=letters[n%letters.length]
      end
    sequence(:student_name) { |n| "Student #{n}" }

    trait :valid do
      student_grade { 70 }
    end

    trait :invalid do
      student_grade { -70 }
    end
  end
end
