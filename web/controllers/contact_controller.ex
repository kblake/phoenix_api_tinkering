defmodule HelloPhoenix.ContactController do
  use HelloPhoenix.Web, :controller
  alias HelloPhoenix.Repo
  alias HelloPhoenix.Contact

  plug :action

  def index(conn, _params) do
    contacts = Repo.all(Contact)
    render conn, contacts: contacts
  end

  #curl -v -H "Content-Type: application/json" -d '{"contact":{"name":"karmen","phone":"111-1111"}}' http://localhost:4000/api/contacts
  def create(conn, %{"contact" => contact_params}) do
    changeset = Contact.changeset(%Contact{}, contact_params)

    if changeset.valid? do
      contact = Repo.insert(changeset)
      render(conn, contact: contact)
    else
      conn
      |> put_status(:unprocessable_entity)
      #|> render(HelloPhoenix.ChangesetView, "error.json", changeset: changeset)
      render(conn, changeset: changeset)
    end
  end
end
