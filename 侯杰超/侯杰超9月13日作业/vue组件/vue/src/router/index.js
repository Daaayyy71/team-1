import Vue from "vue";
import VueRouter from "vue-router";
Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    component: () => import("../App"),
    children: [
      {
        path: "/",
        name: "Login",
        component: () => import("../views/login"),
      },
      {
        path: "/home",
        name: "Home",
        component: () => import("../views/Home"),
        children: [
          {
            path: "/home-one",
            name: "Home-one",
            component: () => import("../components/Home-1"),
          },
          {
            path: "/home-two",
            name: "Home-two",
            component: () => import("../components/Home-2"),
          },
          {
            path: "/home-three",
            name: "Home-three",
            component: () => import("../components/Home-3"),
          },
          {
            path: "/home-four",
            name: "Home-four",
            component: () => import("../components/Home-4"),
          },
          {
            path: "/home-fine",
            name: "Home-fine",
            component: () => import("../components/Home-5"),
          },
          {
            path: "/home-six",
            name: "Home-six",
            component: () => import("../components/Home-6"),
          },
        ],
      },
    ],
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
