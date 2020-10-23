# require 'sqlite3'
# require 'singleton'
# require_relative 'questionsdatabse'
require_relative "required_files"
class Replies
attr_accessor :id, :question_id, :user_id, :parent_reply_id, :body

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |question| Replies.new(question)}  
    end
    

    def self.find_by_id(id)
        find_id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
            *
            FROM
            replies
            WHERE
            id = ?
        SQL
    end

    def initialize(input)
        @user_id = input['user_id']
        @question_id = input['question_id']
        @parent_reply_id = input['parent_reply_id']
        @id = input['id']
        @body = input['body']

    end

    def insert
        raise "#{self} is already in the table, DUDE!!" if self.id

        QuestionsDatabase.instance.execute(<<-SQL, self.question_id,  self.user_id, self.parent_reply_id, self.body)
            INSERT INTO
                replies(question_id, user_id, parent_reply_id, body)
            VALUES
                (?, ?, ?, ?)
        SQL

        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

     def update
        raise "#{self} not in database, DUDE!!" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.question_id,  self.user_id, self.parent_reply_id, self.body, self.id)
            UPDATE
                replies
            SET
                 question_id = ?, user_id = ?, parent_reply_id = ?, body = ? 
            WHERE
                id = ?
        SQL
    end

    def self.find_by_user_id(user_id)
        find_user = QuestionsDatabase.instance.execute(<<-SQL, user_id)

            SELECT
            *
            FROM
            replies
            WHERE
            user_id = ?
        SQL
    end

    def self.find_by_question_id(question_id)
        qi = QuestionsDatabase.instance.execute(<<-SQL, question_id)

            SELECT
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL 
    end

    def author(fname, lname)
        find_author = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                fname, lname
            FROM
                users
            WHERE
                fname = ? AND lname = ?
        SQL
    end


    def question
        
    end
end #!