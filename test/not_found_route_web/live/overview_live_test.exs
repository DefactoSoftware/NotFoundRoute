defmodule NotFoundRouteWeb.OverviewTest do
  use NotFoundRouteWeb.ConnCase

  @routes [
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "page",
      host: nil,
      kind: :match,
      line: 24,
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
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts",
      pipe_through: [:browser],
      plug: TryOutWeb.PostController,
      plug_opts: :index,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:id/edit",
      pipe_through: [:browser],
      plug: TryOutWeb.PostController,
      plug_opts: :edit,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/new",
      pipe_through: [:browser],
      plug: TryOutWeb.PostController,
      plug_opts: :new,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:id",
      pipe_through: [:browser],
      plug: TryOutWeb.PostController,
      plug_opts: :show,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts",
      pipe_through: [:browser],
      plug: TryOutWeb.PostController,
      plug_opts: :create,
      private: %{},
      trailing_slash?: false,
      verb: :post
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:id",
      pipe_through: [:browser],
      plug: TryOutWeb.PostController,
      plug_opts: :update,
      private: %{},
      trailing_slash?: false,
      verb: :patch
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: nil,
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:id",
      pipe_through: [:browser],
      plug: TryOutWeb.PostController,
      plug_opts: :update,
      private: %{},
      trailing_slash?: false,
      verb: :put
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:id",
      pipe_through: [:browser],
      plug: TryOutWeb.PostController,
      plug_opts: :delete,
      private: %{},
      trailing_slash?: false,
      verb: :delete
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post_comment",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:post_id/comments",
      pipe_through: [:browser],
      plug: TryOutWeb.CommentController,
      plug_opts: :index,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post_comment",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:post_id/comments/:id/edit",
      pipe_through: [:browser],
      plug: TryOutWeb.CommentController,
      plug_opts: :edit,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post_comment",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:post_id/comments/new",
      pipe_through: [:browser],
      plug: TryOutWeb.CommentController,
      plug_opts: :new,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post_comment",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:post_id/comments/:id",
      pipe_through: [:browser],
      plug: TryOutWeb.CommentController,
      plug_opts: :show,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post_comment",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:post_id/comments",
      pipe_through: [:browser],
      plug: TryOutWeb.CommentController,
      plug_opts: :create,
      private: %{},
      trailing_slash?: false,
      verb: :post
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post_comment",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:post_id/comments/:id",
      pipe_through: [:browser],
      plug: TryOutWeb.CommentController,
      plug_opts: :update,
      private: %{},
      trailing_slash?: false,
      verb: :patch
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: nil,
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:post_id/comments/:id",
      pipe_through: [:browser],
      plug: TryOutWeb.CommentController,
      plug_opts: :update,
      private: %{},
      trailing_slash?: false,
      verb: :put
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post_comment",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/posts/:post_id/comments/:id",
      pipe_through: [:browser],
      plug: TryOutWeb.CommentController,
      plug_opts: :delete,
      private: %{},
      trailing_slash?: false,
      verb: :delete
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "dashboard",
      host: nil,
      kind: :match,
      line: 31,
      metadata: %{log: :debug},
      path: "/admin/dashboard",
      pipe_through: [:browser],
      plug: TryOutWeb.Admin.DashboardController,
      plug_opts: :dashboard,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/admin/posts",
      pipe_through: [:browser],
      plug: TryOutWeb.Admin.PostController,
      plug_opts: :index,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/admin/posts/:id/edit",
      pipe_through: [:browser],
      plug: TryOutWeb.Admin.PostController,
      plug_opts: :edit,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/admin/posts/new",
      pipe_through: [:browser],
      plug: TryOutWeb.Admin.PostController,
      plug_opts: :new,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/admin/posts/:id",
      pipe_through: [:browser],
      plug: TryOutWeb.Admin.PostController,
      plug_opts: :show,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/admin/posts",
      pipe_through: [:browser],
      plug: TryOutWeb.Admin.PostController,
      plug_opts: :create,
      private: %{},
      trailing_slash?: false,
      verb: :post
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/admin/posts/:id",
      pipe_through: [:browser],
      plug: TryOutWeb.Admin.PostController,
      plug_opts: :update,
      private: %{},
      trailing_slash?: false,
      verb: :patch
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: nil,
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/admin/posts/:id",
      pipe_through: [:browser],
      plug: TryOutWeb.Admin.PostController,
      plug_opts: :update,
      private: %{},
      trailing_slash?: false,
      verb: :put
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "post",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/admin/posts/:id",
      pipe_through: [:browser],
      plug: TryOutWeb.Admin.PostController,
      plug_opts: :delete,
      private: %{},
      trailing_slash?: false,
      verb: :delete
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "overview",
      host: nil,
      kind: :match,
      line: 35,
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
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "root",
      host: nil,
      kind: :match,
      line: 41,
      metadata: %{log: :debug},
      path: "/",
      pipe_through: [:browser, :unauthenticated],
      plug: TryOutWeb.RootController,
      plug_opts: :index,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "register",
      host: nil,
      kind: :match,
      line: 42,
      metadata: %{log: :debug},
      path: "/register",
      pipe_through: [:browser, :unauthenticated],
      plug: TryOutWeb.RegisterController,
      plug_opts: :new,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "register",
      host: nil,
      kind: :match,
      line: 2,
      metadata: %{log: :debug},
      path: "/register",
      pipe_through: [:browser, :unauthenticated],
      plug: TryOutWeb.RegisterController,
      plug_opts: :create,
      private: %{},
      trailing_slash?: false,
      verb: :post
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "auth",
      host: nil,
      kind: :match,
      line: 44,
      metadata: %{log: :debug},
      path: "/login",
      pipe_through: [:browser, :unauthenticated],
      plug: TryOutWeb.AuthController,
      plug_opts: :request,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "auth",
      host: nil,
      kind: :match,
      line: 45,
      metadata: %{log: :debug},
      path: "/:provider/callback",
      pipe_through: [:browser, :unauthenticated],
      plug: TryOutWeb.AuthController,
      plug_opts: :callback,
      private: %{},
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "auth",
      host: nil,
      kind: :match,
      line: 46,
      metadata: %{log: :debug},
      path: "/identity/callback",
      pipe_through: [:browser, :unauthenticated],
      plug: TryOutWeb.AuthController,
      plug_opts: :identity_callback,
      private: %{},
      trailing_slash?: false,
      verb: :post
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "live_dashboard",
      host: nil,
      kind: :match,
      line: 64,
      metadata: %{
        log: :debug,
        phoenix_live_view: {Phoenix.LiveDashboard.PageLive, :home}
      },
      path: "/dashboard",
      pipe_through: [],
      plug: Phoenix.LiveView.Plug,
      plug_opts: :home,
      private: %{
        csp_nonce_assign_key: nil,
        live_socket_path: "/live"
      },
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "live_dashboard",
      host: nil,
      kind: :match,
      line: 64,
      metadata: %{
        log: :debug,
        phoenix_live_view: {Phoenix.LiveDashboard.PageLive, :page}
      },
      path: "/dashboard/:page",
      pipe_through: [],
      plug: Phoenix.LiveView.Plug,
      plug_opts: :page,
      private: %{
        csp_nonce_assign_key: nil,
        live_socket_path: "/live"
      },
      trailing_slash?: false,
      verb: :get
    },
    %Phoenix.Router.Route{
      assigns: %{},
      helper: "live_dashboard",
      host: nil,
      kind: :match,
      line: 64,
      metadata: %{
        log: :debug,
        phoenix_live_view: {Phoenix.LiveDashboard.PageLive, :page}
      },
      path: "/dashboard/:node/:page",
      pipe_through: [],
      plug: Phoenix.LiveView.Plug,
      plug_opts: :page,
      private: %{
        csp_nonce_assign_key: nil,
        live_socket_path: "/live"
      },
      trailing_slash?: false,
      verb: :get
    }
  ]

  @get_route %Phoenix.Router.Route{
    assigns: %{},
    helper: "post",
    host: nil,
    kind: :match,
    line: 2,
    metadata: %{log: :debug},
    path: "/posts",
    pipe_through: [:browser],
    plug: TryOutWeb.PostController,
    plug_opts: :index,
    private: %{},
    trailing_slash?: false,
    verb: :get
  }

  @post_route %Phoenix.Router.Route{
    assigns: %{},
    helper: "post",
    host: nil,
    kind: :match,
    line: 2,
    metadata: %{log: :debug},
    path: "/posts",
    pipe_through: [:browser],
    plug: TryOutWeb.PostController,
    plug_opts: :create,
    private: %{},
    trailing_slash?: false,
    verb: :post
  }
  @edit_post_route %Phoenix.Router.Route{
    assigns: %{},
    helper: "post",
    host: nil,
    kind: :match,
    line: 2,
    metadata: %{log: :debug},
    path: "/posts/:id/edit",
    pipe_through: [:browser],
    plug: TryOutWeb.PostController,
    plug_opts: :edit,
    private: %{},
    trailing_slash?: false,
    verb: :get
  }
  describe("#match_keyword") do
    test "matches on they verb get" do
      assert NotFoundRouteWeb.OverviewLive.match_keyword(@routes |> List.first(), {"verb", "get"})
    end

    test "matches on the verb post" do
      assert NotFoundRouteWeb.OverviewLive.match_keyword(@post_route, {"verb", "post"})
    end

    test "does not match get_route on for explicit post verb" do
      refute NotFoundRouteWeb.OverviewLive.match_keyword(@get_route, {"verb", "post"})
    end

    test "searches on every key when given action is nil" do
      assert NotFoundRouteWeb.OverviewLive.match_keyword(@get_route, {nil, "post"})

      assert NotFoundRouteWeb.OverviewLive.match_keyword(@post_route, {nil, "post"})

      assert NotFoundRouteWeb.OverviewLive.match_keyword(@edit_post_route, {nil, "post"})
    end
  end
end
