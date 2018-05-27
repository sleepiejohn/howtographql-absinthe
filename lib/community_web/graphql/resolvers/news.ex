defmodule CommunityWeb.Graphql.Resolvers.News do
  alias Community.News, as: NewsCtx

  def all_links(_root, _args, _info) do
    links = NewsCtx.list_links()
    {:ok, links}
  end

  def create_link(_root, args, _info) do
    case NewsCtx.create_link(args) do
      {:ok, link} -> {:ok, link}
      _ -> {:error, "Server failed to create link #{args.description}"}
    end
  end

  def link(_root, %{id: id}, _info) do
    {:ok, NewsCtx.get_link!(id)}
  end
end
