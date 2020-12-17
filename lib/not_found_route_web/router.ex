defmodule NotFoundRouteWeb.Router do
  use NotFoundRouteWeb, :router

  defmacro live_not_found(opts \\ []) do
    if Mix.env() in [:dev] do
      quote bind_quoted: binding() do
        scope "/", alias: false, as: false do
          import Phoenix.LiveView.Router, only: [live: 4]

          live "/*anything", NotFoundRouteWeb.OverviewLive, :index,
            layout: {NotFoundRouteWeb.LayoutView, :root}
        end
      end
    end
  end
end
