alias Community.Repo
alias Community.News.{Link}

[
  %Link{url: "http://graphql.org/", description: "The Best Query Language"},
  %Link{url: "http://dev.apollodata.com/", description: "Awesome GraphQL Client"}
] |> Enum.each(&Repo.insert!/1)

