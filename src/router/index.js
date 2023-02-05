import { createRouter, createWebHistory } from "vue-router";
import Home from "./../components/Home.vue";
import Page1 from "./../components/Page1.vue";

const routes = [
  {
    path: "/",
    component: Home,
    name: "home",
  },
  {
    path: "/show-page",
    component: Page1,
    name: "show_page",
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes: routes,
});

export default router;
