FactoryBot.define do
  factory :challenge do
    name "addition"
    description "it solves addition"
    created_at Time.zone.now
    updated_at Time.zone.now
  end
end
