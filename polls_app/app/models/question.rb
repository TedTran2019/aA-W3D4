class Question < ApplicationRecord
  validates :poll, :text, presence: true
  validates :text, uniqueness: { scope: :poll_id }

  has_many :answer_choices

  belongs_to :poll

  has_many :responses,
  through: :answer_choices,
  source: :responses

  # Could also combine answer_choices association w/ responses
  # If you do that, there won't be a need for the "where"
  def results
    dict = {}
    res = AnswerChoice
    .select('answer_choices.text, COUNT(responses.id) AS votes')
    .left_outer_joins(:responses)
    .where("question_id = ?", self.id)
    .group(:id)

    res.each { |obj| dict[obj.text] = obj.votes }
    dict
  end
end
