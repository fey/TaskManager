FactoryBot.define do
  factory :task do
    name
    description
    author factory: :manager
    assignee factory: :developer
    state { 'new_task' }
    expired_at { '2021-08-15' }
  end
end
