# ExClubhouse

[![build](https://github.com/humberaquino/exclubhouse/workflows/build/badge.svg)](https://github.com/humberaquino/exclubhouse/actions?query=branch%3Amaster+workflow%3Abuild)
[![Coverage Status](https://coveralls.io/repos/github/humberaquino/exclubhouse/badge.svg?branch=master)](https://coveralls.io/github/humberaquino/exclubhouse?branch=master)
[![hex](https://img.shields.io/hexpm/v/exclubhouse)](https://hex.pm/packages/exclubhouse)
[![license](https://img.shields.io/github/license/humberaquino/exclubhouse)](LICENSE)

Clubhouse client library for Elixir 🧙‍♂️

Uses Clubhouse REST API V3: https://clubhouse.io/api/rest/v3/

# Installation

Add `exclubhouse` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exclubhouse, "~> 0.6.0"}
  ]
end
```

# Setup and basic usage

### 1. Add an API token in your config

```elixir
config :exclubhouse, 
  token: "xxxxx-xxxx-xxxx-xxx-xxx"
```

Here's [CH help center doc](https://help.clubhouse.io/hc/en-us/articles/205701199-Clubhouse-API-Tokens) on how to generate a CH API token

### 2. Use the API

```Elixir
alias ExClubhouse.{Api, Model}

epic_input = Input.Epic{ 
  name: "Your first Epic",
  description: "Some description for the epic"
} 

Api.Epic.create(epic_input) 
```

Output example:
```Elixir
{:ok,
 %ExClubhouse.Model.Epic{
   app_url: "https://app.clubhouse.io/kamehouse/epic/22",
   description: "Some description for the epic",
   id: 22,
   name: "Your first Epic",
   ...
   updated_at: "2020-03-15T21:43:04Z"
 }}
```

You can find all API grouped under `ExClubhouse.Api`

## Custom usage

In some cases we want to use different tokens for the same call, use the response as-is or simply debug 
a call to the API using iEx. For those case we can build the API call like this:
1. Build a session
2. Create an operation
3. Pass the operation and session to the client to make a request
4. Parse the client's result

E.g.

```Elixir
alias ExClubhouse.{Api, Client, Session, Config, Model, Parse}

# 1. Get a default session from the config
sess = Config.default() |> Session.from()
# Or Build it passing the actual token
sess = %Session{token: "xxxxx-xxxx-xxxx-xxx-xxx"}

# 2. Build the operation
op = Ops.Epic.get(42)

# 3. Make the request
result = Client.HTTP.request(op, sess)

# 4 Parse the result
{:ok, %Model.Epic{} = epic42} = Parser.parse(result)
```

# Design guidelines

Here's a list of design guidelines used in the project:
- 🛸Don't hide anything, but make things easy: The lib can be used as Op+Client+Parser independently or 
through `ExClubhouse.Api` .
- 🍔 Decouple operations, HTTP client and parsing: To allow people to use the lib as they need (e.g. with or without models/structs).
- 🎁 Results are parsed and presented as structs: for easy pattern matching and usage.
- 🏄‍♀️ Typespec surface API: Help make correct API calls.

# Project roadmap

## Current: v0.6.1

- Fix for Story update [#4](https://github.com/humberaquino/exclubhouse/issues/4)

## Previous 

### v0.6.0

- File upload support added

### v0.5.2

- Search API added

### v0.5.1

- Integrate with Coveralls
- Fixes bug on `Label.stories_list/1` function
- Increases test coverage to >80%

### v0.5.0
- Initial release

# License

Please see [LICENSE](LICENSE) for licensing details.
