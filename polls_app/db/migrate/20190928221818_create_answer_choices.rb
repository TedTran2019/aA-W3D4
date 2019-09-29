class CreateAnswerChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_choices do |t|
      t.text :text, null: false
      t.integer :question_id, null: false
      t.timestamps
    end

    add_index :answer_choices, :question_id
    add_index :answer_choices, [:text, :question_id], unique: true
  end
end
