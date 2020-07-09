class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?)
    SQL
 
     db.execute(sql, name, type)
  end

  def self.find(id, db)
    #binding.pry
    row_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)

    row_array = Pokemon.new(id: row_array[0][0], name: row_array[0][1], type: row_array[0][2], db: db)
  end
end
