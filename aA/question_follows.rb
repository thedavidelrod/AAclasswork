# require 'sqlite3'
# require 'singleton'
# require_relative 'questionsdatabse'
require_relative "required_files"
class Question_Follows
attr_accessor :id, :question_id :user_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |question| Question_Follows.new(question)}  
    end
    

    def self.find_by_id(id)
        find_id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
            *
            FROM
            question_follows
            WHERE
            id = ?
        SQL
    end

    def initialize(input)
        @user_id = input['user_id']
        @question_id = input['question_id']
    end

    def insert
        raise "#{self} is already in the table, DUDE!!" if self.id

        QuestionsDatabase.instance.execute(<<-SQL, self.question_id,  self.user_id)
            INSERT INTO
                question_follows(question_id, user_id)
            VALUES
                (?, ?)
        SQL

        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

     def update
        raise "#{self} not in database, DUDE!!" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.question_id, self.id, self.user_id)
            UPDATE
                question_follows
            SET
                 question_id = ?, user_id = ? 
            WHERE
                id = ?
        SQL
    end


end #!