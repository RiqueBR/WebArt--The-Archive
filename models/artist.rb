require_relative('../db/sql_runner')

class Artist

  attr_accessor :first_name, :last_name, :artist_info, :artist_img
  attr_reader :id


  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @artist_info = options["artist_info"]
    @artist_img = options["artist_img"]
  end

  def save()
    sql = "INSERT INTO artists (
    first_name, last_name, artist_info, artist_img
  )
  VALUES (
    $1, $2, $3, $4
    ) RETURNING id"
    values = [@first_name, @last_name, @artist_info, @artist_img]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE artists SET
    (first_name, last_name, artist_info, artist_img) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@first_name, @last_name, @artist_info, @artist_img, @id]
    SqlRunner.run(sql, values)
  end

  def exhibitions
    sql = "SELECT * FROM exhibitions WHERE exhibitions.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first
    return Exhibition.new(result)
  end



  def self.find_all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map { |artist_hash| Artist.new(artist_hash) }
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.find_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Artist.new(result)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
end
