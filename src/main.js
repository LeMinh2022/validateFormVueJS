import { createApp } from "vue";
import { createI18n } from "vue-i18n";
import vnMessage from "./lang/vn.json";
import enMessage from "./lang/en.json";
import App from "./App.vue";
import "bootstrap/dist/css/bootstrap.css";
import router from "./router";

const messages = {
  vn: vnMessage,
  en: enMessage,
};

export const i18n = createI18n({
  locale: "vn",
  fallbackLocale: "vn",
  messages,
});

createApp(App).use(i18n).use(router).mount("#app");
