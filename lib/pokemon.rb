require 'pry'

class Pokemon

attr_accessor :name, :type, :db, :id, :hp

def initialize(id:nil, name:, type:, db:, hp:nil)
  @name = name
  @type = type
  @db = db
  @id = id
  @hp = hp
end

def self.save(name, type, db)
  sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?,?)
  SQL
  db.execute(sql, name, type)
end

def self.find(id, db)
  sql = <<-SQL
    SELECT * FROM pokemon
    WHERE pokemon.id = ?
    SQL
    x = db.execute(sql, id)[0]
    newpk = self.new(id:x[0], name:x[1], type:x[2], db:db, hp:x[3])
end

  def alter_hp(new_hp,db)
    sql = <<-SQL
      UPDATE pokemon
      SET hp = ?
      WHERE id = ?
      SQL
      db.execute(sql, new_hp, self.id)
     end


end
