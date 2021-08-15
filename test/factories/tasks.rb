FactoryBot.define do
  factory :task do
    name
    description
    author factory: :manager
    assignee factory: :developer
    state { 'MyString' }
    expired_at { '2021-08-15' }
  end
end
