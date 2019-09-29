class Response < ApplicationRecord
  validates :respondent, :answer_choice, presence: true
  validate :not_duplicate_response, :not_response_to_own_poll

  belongs_to :respondent, 
  foreign_key: :user_id,
  class_name: :User

  belongs_to :answer_choice

  has_one :question, 
  through: :answer_choice,
  source: :question

  has_one :poll,
  through: :question,
  source: :poll

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sib_responses = sibling_responses.includes(:respondent)
    resp_id = respondent.id
    sib_responses.any? { |response| response.respondent.id == resp_id }
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:answer_once_only] << "You can only answer a question once!"
    end
  end

  def not_response_to_own_poll
    if poll.author_id == respondent.id
      errors[:cant_respond_to_own_poll] << "Don't respond to your own poll!"
    end
  end
end
