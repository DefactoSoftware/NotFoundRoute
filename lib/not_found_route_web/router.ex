defmodule NotFoundRouteWeb.Router do
  use NotFoundRouteWeb, :router

  defmacro live_not_found(opts \\ []) do
    if Mix.env() in [:dev] do
      quote bind_quoted: binding() do
        scope "/", alias: false, as: false do
          {session_opts, route_opts} = NotFoundRouteWeb.Router.__options__(opts)

          live_session(:not_found, session_opts) do
            import Phoenix.LiveView.Router, only: [live: 4]

            live "/*anything", NotFoundRouteWeb.OverviewLive, :index, route_opts
          end
        end
      end
    end
  end

  def __options__(options) do
    live_socket_path = Keyword.get(options, :live_socket_path, "/live-ws")

    {
      [
        root_layout: {NotFoundRouteWeb.LayoutView, :root}
      ],
      [
        private: %{live_socket_path: live_socket_path}
      ]
    }
  end
end
