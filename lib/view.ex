defmodule View do

  def not_found(conn, message) do
    conn
    |> Plug.Conn.send_resp(404, message)
  end

  def render(conn, data) do
    conn
    |> Plug.Conn.send_resp(200, data)
  end

  def render(conn, type, data) do
    conn
    |> Plug.Conn.put_resp_content_type(type)
    |> Plug.Conn.send_resp(200, data)
  end
end
