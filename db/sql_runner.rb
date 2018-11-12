require('pg')

class SqlRunner

  def self.run(sql, values = [])
  begin
    db = PG.connect({ dbname: "dc4c69ga43ga29", host: 'ec2-54-243-147-183.compute-1.amazonaws.com', port: 5432, user: 'jlykqiivyggzks', password: 'd7bee3aaa1006c062b0a50ccef42e783bf60374f156bad29b3b6fce3273e9a1e'})
    db.prepare("query", sql)
    result = db.exec_prepared("query", values)
  ensure
    db.close() if db != nil
  end
  return result
end
end
