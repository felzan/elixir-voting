defmodule Voting.Factory do
  use ExMachina.Ecto, repo: Voting.Repo

  def admin_factory do
    %Voting.Admin{
      name: "Foo",
      email: "email@email.com",
      password_hash: Bcrypt.hash_pwd_salt("123456")
    }
  end
end