defmodule NotFoundRouteWeb.OverviewTest do
  use NotFoundRouteWeb.ConnCase

  import Phoenix.LiveViewTest

  @routes [
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "page",
      host: nil,
      kind: :match,
      line: 21,
      metadata: %{log: :debug, phoenix_live_view: {TryOutWeb.PageLive, :index}},
      path: "/",
      pipe_through: [:browser],
      plug: Phoenix.LiveView.Plug,
      plug_opts: :index,
      private: %{
        phoenix_live_view: {TryOutWeb.PageLive, [action: :index, router: TryOutWeb.Router]}
      },
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "live_dashboard",
      host: nil,
      kind: :match,
      line: 41,
      metadata: %{
        log: :debug,
        phoenix_live_view: {Phoenix.LiveDashboard.PageLive, :home}
      },
      path: "/dashboard",
      pipe_through: [:browser],
      plug: Phoenix.LiveView.Plug,
      plug_opts: :home,
      private: %{
        csp_nonce_assign_key: nil,
        live_socket_path: "/live",
        phoenix_live_view:
          {Phoenix.LiveDashboard.PageLive,
           [
             action: :home,
             router: TryOutWeb.Router,
             session:
               {Phoenix.LiveDashboard.Router, :__session__,
                [nil, false, {TryOutWeb.Telemetry, :metrics}, nil, [], nil, nil]},
             layout: {Phoenix.LiveDashboard.LayoutView, :dash},
             as: :live_dashboard
           ]}
      },
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "live_dashboard",
      host: nil,
      kind: :match,
      line: 41,
      metadata: %{
        log: :debug,
        phoenix_live_view: {Phoenix.LiveDashboard.PageLive, :page}
      },
      path: "/dashboard/:page",
      pipe_through: [:browser],
      plug: Phoenix.LiveView.Plug,
      plug_opts: :page,
      private: %{
        csp_nonce_assign_key: nil,
        live_socket_path: "/live",
        phoenix_live_view:
          {Phoenix.LiveDashboard.PageLive,
           [
             action: :page,
             router: TryOutWeb.Router,
             session:
               {Phoenix.LiveDashboard.Router, :__session__,
                [nil, false, {TryOutWeb.Telemetry, :metrics}, nil, [], nil, nil]},
             layout: {Phoenix.LiveDashboard.LayoutView, :dash},
             as: :live_dashboard
           ]}
      },
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "live_dashboard",
      host: nil,
      kind: :match,
      line: 41,
      metadata: %{
        log: :debug,
        phoenix_live_view: {Phoenix.LiveDashboard.PageLive, :page}
      },
      path: "/dashboard/:node/:page",
      pipe_through: [:browser],
      plug: Phoenix.LiveView.Plug,
      plug_opts: :page,
      private: %{
        csp_nonce_assign_key: nil,
        live_socket_path: "/live",
        phoenix_live_view:
          {Phoenix.LiveDashboard.PageLive,
           [
             action: :page,
             router: TryOutWeb.Router,
             session:
               {Phoenix.LiveDashboard.Router, :__session__,
                [nil, false, {TryOutWeb.Telemetry, :metrics}, nil, [], nil, nil]},
             layout: {Phoenix.LiveDashboard.LayoutView, :dash},
             as: :live_dashboard
           ]}
      },
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "overview",
      host: nil,
      kind: :match,
      line: 43,
      metadata: %{
        log: :debug,
        phoenix_live_view: {NotFoundRouteWeb.OverviewLive, :index}
      },
      path: "/*anything",
      pipe_through: [:browser],
      plug: Phoenix.LiveView.Plug,
      plug_opts: :index,
      private: %{
        phoenix_live_view:
          {NotFoundRouteWeb.OverviewLive,
           [
             action: :index,
             router: TryOutWeb.Router,
             layout: {NotFoundRouteWeb.LayoutView, :root}
           ]}
      },
      trailing_slash?: false,
      verb: :get
    }
  ]

  describe "#match_keyword" do
    test "matches on they verb" do
      assert NotFoundRouteWeb.OverviewLive.match_keyword(@routes |> List.first(), {"verb", "get"})
    end
  end
end
