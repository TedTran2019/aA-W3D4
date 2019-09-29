class AnswerChoice < ApplicationRecord
  validates :question, :text, presence: true
  validates :text, uniqueness: { scope: :question_id }

  belongs_to :question

  has_many :responses,
  dependent: :destroy
end
