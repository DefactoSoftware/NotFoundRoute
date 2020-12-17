[![Hex pm](http://img.shields.io/hexpm/v/not_found_route.svg?style=flat)](https://hex.pm/packages/not_found_route)

# NotFoundRoute

Shows the routes in a (non umbrella) phoenix app with a live filter through all
routes. This is only enabled in `:dev` mode

![search](https://user-images.githubusercontent.com/1089927/102547581-b08ba000-40b9-11eb-83bd-5f72249e0999.gif)

Needed to run:
  * Phoenix > 1.4
  * LiveView (only needed for search)

# Install

Add to `mix.exs`

```ex
def deps do
  # ...
  {:not_found_route, "0.0.1"}
end
```

In `lib/my_app_web/router.ex`

```ex
defmodule MyAppWeb.Router do
  # ...
  import NotFoundRouteWeb.Router
  # ...

  # Add this as last route in the "/" scope
  live_not_found()
end
```
