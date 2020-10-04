defmodule VotingWeb.Admin.SessionControllerTest do
  use VotingWeb.ConnCase, async: true

  import Voting.Factory

  describe "create/2" do
    setup %{conn: conn} do
      insert(:admin, name: "Name", email: "email@email.com")

      %{conn: conn}
    end

    test "returns 200 when admin credentials are valid", %{conn: conn} do
      conn = post(conn, "api/v1/admin/sign_in", %{"email" => "email@email.com", "password" => "123456"})

      assert %{"status" => "ok", "data" => %{"name" => "Name"}} = json_response(conn, 200)
    end

    test "returns 401 when admin email is invalid", %{conn:  conn} do
      conn = post(conn, "api/v1/admin/sign_in", %{"email" => "wrong@email.com", "password" => "123456"})

      assert %{"status" => "Unauthorized"} = json_response(conn, 401)
    end

    test "returns 401 when admin password is invalid", %{conn:  conn} do
      conn = post(conn, "api/v1/admin/sign_in", %{"email" => "email@email.com", "password" => "!456"})

      assert %{"status" => "Unauthorized"} = json_response(conn, 401)
    end
  end
end