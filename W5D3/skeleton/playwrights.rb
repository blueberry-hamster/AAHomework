require 'sqlite3'
require 'singleton'

class PlaywrightDBConnection < SQLite3::Database
    include Singleton 

    def initialize
        super('playwrights.rb')
        self.type_translation = true
        self.results_as_hash = true 
    end
end

class Playwright 
    attr_accessor :id, :name, :birth_year

    def self.all
        data = PlaywrightDBConnection.instance.execute("SELECT * FROM playwrights")
        data.map { |datum| Playwright.new(datum) }
    end

    def self.find_by_name(name)
        PlaywrightDBConnection.instance.execute(<<-SQL, name)
            SELECT
                *
            FROM
                playwrights
            WHERE
                playwrights.name = ?
        SQL
    end

    def initialize(options)
        @id = options['id']
        @name = options['name']
        @birth_year = options['birth_year']
    end

    def create
        raise "#{self} already in database" if self.id 
        PlaywrightDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
            INSERT INTO
                playwrights (name, birth_year)
            VALUES
                (?, ?)
        SQL
        self.id = PlaywrightDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
            UPDATE
                playwrights
            SET
                name = ?, birth_year = ?
            WHERE
                id = ?
        SQL
    end
end