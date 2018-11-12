require('pg')

class SqlRunner

  def self.run(sql, values = [])
  begin
    db = PG.connect({dbname: 'd3gop52752nsl4', host: 'ec2-54-197-250-121.compute-1.amazonaws.com', port: 5432, user: 'efujlsjmlgmklw', password: '16928bfcface7673f0c651b8ad4657dc3fd47bc5c62cd692471cf22fe62d8399'})
    db.prepare("query", sql)
    result = db.exec_prepared("query", values)
  ensure
    db.close() if db != nil
  end
  return result
end
end
