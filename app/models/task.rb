class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :description, length: { maximum: 500 }

  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  state_machine initial: :new_task do
    event :begin_develop do
      transition new_task: :in_development
    end

    event :begin_test do
      transition in_development: :in_qa
    end

    event :return_to_development do
      transition [:in_qa, :in_code_review] => :in_development
    end

    event :start_review do
      transition in_qa: :in_code_review
    end

    event :prepare_for_release do
      transition in_code_review: :ready_for_release
    end

    event :release do
      transition ready_for_release: :released
    end

    event :archive do
      transition [:new_task, :released] => :archived
    end
  end
end
