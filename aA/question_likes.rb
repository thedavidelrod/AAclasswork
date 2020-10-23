# CREATE TABLE question_likes(
# likes_id INTEGER PRIMARY KEY,
# likes INTEGER,
# user_id INTEGER NOT NULL,
# questions_id INTEGER NOT NULL,
# FOREIGN KEY (user_id) REFERENCES users(id),
# FOREIGN KEY (questions_id) REFERENCES questions(id)
# );

# require 'sqlite3'
# require 'singleton'
# require_relative 'questionsdatabse'
require_relative "required_files"
class Question_Likes
attr_accessor :likes, :likes_id :user_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map { |question| Question_Likes.new(question)}  
    end
    

    def self.find_by_id(id)
        find_id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
            *
            FROM
            question_likes
            WHERE
            likes_id = ?
        SQL
    end

    def initialize(input)
        @user_id = input['user_id']
        @likes = input['likes']
        @likes_id = input['likes_id']
    end

    def insert
        raise "#{self} is already in the table, DUDE!!" if self.id

        QuestionsDatabase.instance.execute(<<-SQL, self.questions_id,  self.likes,)
            INSERT INTO
                question_follows(questions_id, likes)
            VALUES
                (?, ?)
        SQL

        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

     def update
        raise "#{self} not in database, DUDE!!" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.questions_id, likes_id, self.user_id)
            UPDATE
                question_follows
            SET
                 question_id = ?, user_id = ?, likes_id = ?
            WHERE
                id = ?
        SQL
    end


end #!