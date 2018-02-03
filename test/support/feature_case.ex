defmodule TmtaWeb.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias Tmta.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import TmtaWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Tmta.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Tmta.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Tmta.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end