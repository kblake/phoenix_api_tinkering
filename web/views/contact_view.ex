defmodule HelloPhoenix.ContactView do
  use HelloPhoenix.Web, :view

  def render("index.json", %{contacts: contacts}) do
    contacts
  end

  def render("create.json", %{contact: contact}) do
    contact
  end

  def render("error.json", %{changeset: changeset}) do
    %{error: changeset}
  end
end
