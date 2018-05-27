defmodule CommunityWeb.Graphql.Schema do
  use Absinthe.Schema

  alias CommunityWeb.Graphql.Resolvers.News

  # Define the link object (a single link)
  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end

  # Root entry point
  query do
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve(&News.all_links/3)
    end
    field :link, :link do
      arg :id, non_null(:id)
      resolve(&News.link/3)
    end
  end

  mutation do
    field :create_link, :link do
      arg :url, non_null(:string)
      arg :description, non_null(:string)

      resolve(&News.create_link/3)
    end
  end
end
