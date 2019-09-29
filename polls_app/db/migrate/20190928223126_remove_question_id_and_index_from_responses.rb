class RemoveQuestionIdAndIndexFromResponses < ActiveRecord::Migration[6.0]
  def change
    remove_index :responses, [:user_id, :question_id]
    remove_index :responses, :question_id
    remove_column :responses, :question_id
  end
end
