# require 'sqlite3'
# require 'singleton'
# require_relative 'questionsdatabse'
require_relative "required_files"
class Questions
attr_accessor :id, :title, :body, :user_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |question| Questions.new(question)}  
    end
    
    def self.find_by_title(title)
        find_title = QuestionsDatabase.instance.execute(<<-SQL, title)
            SELECT
            *
            FROM
            questions
            WHERE
            title = ?
        SQL
    end

    def self.find_by_id(id)
        find_id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
            *
            FROM
            questions
            WHERE
            id = ?
        SQL
    end

    def initialize(input)
        @title = input['title']
        @body = input['body']
        @user_id = input['user_id']
        @id = input['id']
    end

    def insert
        raise "#{self} is already in the table, DUDE!!" if self.id

        QuestionsDatabase.instance.execute(<<-SQL, self.body, self.title, self.user_id)
            INSERT INTO
                questions(body, title, user_id)
            VALUES
                (?, ?, ?)
        SQL

        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

     def update
        raise "#{self} not in database, DUDE!!" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.id, self.user_id)
            UPDATE
                questions
            SET
                title = ?, body = ?, user_id = ?
            WHERE
                id = ?
        SQL
    end

    def self.find_by_user_id(user_id)
        find_user = QuestionsDatabase.instance.execute(<<-SQL, user_id)

            SELECT
            *
            FROM
            questions
            WHERE
            user_id = ?
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

    def replies
        # reply = QuestionsDatabase.instance.execute(<<-SQL)
        #     SELECT
        #         body
        #     FROM
        #         replies
        #     WHERE
        #         = ?
        # SQL
        Reply.find_by_question_id(question_id)
    end


end #!