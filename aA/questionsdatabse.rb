# require "sqlite3"
# require "singleton"
# require "byebug"
require_relative "required_files"
class QuestionsDatabase < SQLite3::Database
include Singleton
    
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end

end #!

class User 
    attr_accessor :fname, :lname, :id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map{ |user| User.new(user) }
    end

    def self.find_by_id(id)
        search_id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?;
        SQL
        
        User.new(search_id.first)
    end

    def self.find_by_name(fname, lname)
        # fname, lname = name.split(" ")
        find_name = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            
        SELECT
        *
        FROM 
        users
        WHERE 
        fname = ? AND lname = ?;
        SQL
        
        User.new(find_name.first)

    end

    def initialize(input)
        @fname = input['fname']
        @lname = input['lname']
        @id = input['id']
    end


    def insert
        raise "#{self} is already in the table, DUDE!!" if self.id

        QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
            INSERT INTO
                users(fname, lname)
            VALUES
                (?, ?)
        SQL

        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database, DUDE!!" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
            UPDATE
                users
            SET
                fname = ?, lname = ?
            WHERE
                id = ?
        SQL
    end

    def authored_questions(user_id)
        Questions.find_by_user_id(user_id)
    end

    def authored_replies(user_id)
        Replies.find_by_id(user_id)
    end

    
end #!

