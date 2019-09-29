# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Just use rails db:reset

User.create!([{ username: "Ted" }, { username: "Steven" }, { username: "Poitier" } ])
User.create(username: "Poll Creator") # 4th user to test responding to own poll validation

Poll.create!(title: "One", author_id: 4)
Poll.create!(title: "Two", author_id: 4)
Poll.create!(title: "Three", author_id: 4)

Question.create!(text: "Are you Ted", poll_id: 1)
Question.create!(text: "Are you Steven", poll_id: 1)
Question.create!(text: "Are you Steven", poll_id: 2)

# Can't reuse same AnswerChoice for different questions because it requires question_id
AnswerChoice.create!(text: "Yes", question_id: 1)
AnswerChoice.create!(text: "No", question_id: 1)
AnswerChoice.create!(text: "Yes", question_id: 2)
AnswerChoice.create!(text: "No", question_id: 3)

Response.create!(user_id: 1, answer_choice_id: 1) # User 1 responds to question 1
Response.create!(user_id: 1, answer_choice_id: 4) # User 1 responds to question 3
Response.create!(user_id: 2, answer_choice_id: 2) # User 2 responds to question 1
Response.create!(user_id: 2, answer_choice_id: 3) # User 2 responds to question 2
Response.create!(user_id: 3, answer_choice_id: 2) # User 3 responds to question 1
Response.create!(user_id: 3, answer_choice_id: 4) # User 3 responds to question 3