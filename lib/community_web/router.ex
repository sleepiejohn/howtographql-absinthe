defmodule CommunityWeb.Router do
  use CommunityWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CommunityWeb do
    pipe_through :api
  end

  scope "/" do
    pipe_through(:api)
    forward("/graphiql", Absinthe.Plug.GraphiQL,
     schema: CommunityWeb.Graphql.Schema,
    interface: :playground,
    context: %{pubsub: CommunityWeb.Endpoint})
  end
end
