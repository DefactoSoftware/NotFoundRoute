# NotFoundRoute

Shows the routes in a (non umbrella) phoenix app with a live filter through all
routes.

![search](https://user-images.githubusercontent.com/1089927/102547581-b08ba000-40b9-11eb-83bd-5f72249e0999.gif)

Needed to run:
  * Phoenix > 1.4
  * LiveView (only needed for search)

# Install

Add to `mix.exs`

```ex
def deps do
  # ...
  {:not_found_route, path: " https://github.com/DefactoSoftware/NotFoundRoute.git"}
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
