FactoryBot.define do
  factory :problem_set do
    arguments "1 2"
    answer "3"
    created_at Time.zone.now
    updated_at Time.zone.now
  end
end
