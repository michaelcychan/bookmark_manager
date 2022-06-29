# ./spec/database_helpers.rb

require_relative '../lib/database_connection'

def persisted_data(table:, id:)
  if table == "bookmarks"
    return DatabaseConnection.query(
      "SELECT * FROM bookmarks WHERE id = $1",
      [id]
    )
  end
  if table == "comments"
    return DatabaseConnection.query(
      "SELECT * FROM comments WHERE id = $1",
      [id]
    )
  end
end