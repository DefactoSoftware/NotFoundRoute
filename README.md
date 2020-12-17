# NotFoundRoute

Shows the routes in a (non umbrella) phoenix app with a live filter through all
routes.


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
