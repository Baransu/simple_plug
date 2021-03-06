defmodule Router do
  import Plug.Conn

  def init(default_opts) do
    IO.puts "starting up SimplePlug..."
    default_opts
  end

  def call(conn, _opts) do
    route(conn.method, conn.path_info, conn)
  end

  # this route is for /api
  def route("GET", ["api"], conn) do
    data = """
    { "data": "success" }
    """
    conn
    |> View.render("application/json", data)
  end

  # this route is for /api/users/:id
  def route("GET", ["api", "users", id], conn) do
    conn
    |> View.render("Your requested user #{id}")
  end

  def route(_method, _path, conn) do
    conn
    |> View.not_found("Page not found!")
  end
end
