<template>
  <div>
    <div class="container">
      <div class="row">
        <div class="col-12">
          <h2>{{ $t("show_information") }}</h2>
        </div>
        <div class="col-4">
          {{ $t("show_name") }} {{ firstName }} {{ lastName }}
        </div>
        <div class="col-4">{{ $t("show_email") }} {{ email }}</div>
        <div class="col-4">{{ $t("show_phone") }} {{ phone }}</div>
        <div class="col-4">{{ $t("show_gender") }} {{ genderId }}</div>
        <div class="col-8">
          {{ $t("show_address") }} {{ wardId }} {{ districtsId }}
          {{ provincesId }}
        </div>
        <div class="col-12">
          <button class="button" @click="back">{{ $t("close") }}</button>
        </div>
      </div>
      <br />
    </div>
  </div>
</template>
<script>
import { computed } from "@vue/reactivity";
import { useRoute } from "vue-router";
import router from "../router";
export default {
  setup() {
    const route = useRoute();
    const firstName = computed(() => route.query.first_name);
    const lastName = computed(() => route.query.last_name);
    const email = computed(() => route.query.email);
    const phone = computed(() => route.query.phone);
    const genderId = computed(() => route.query.gender);
    const provincesId = computed(() => route.query.province);
    const districtsId = computed(() => route.query.district);
    const wardId = computed(() => route.query.ward);

    const back = function () {
      router.push({
        name: "home",
      });
    };
    return {
      back,
      firstName,
      lastName,
      email,
      phone,
      genderId,
      provincesId,
      districtsId,
      wardId,
    };
  },
};
</script>
<style scoped>
.container {
  margin-top: 20px;
  width: 900px;
  border: 1px solid black;
  border-radius: 10px;
  border-radius: 15px;
  box-shadow: 5px 5px;
}
.button {
  align-items: center;
  background-color: white;
  border: 2px solid #111;
  border-radius: 8px;
  box-sizing: border-box;
  color: #111;
  cursor: pointer;
  display: flex;
  font-family: Inter, sans-serif;
  font-size: 16px;
  height: 48px;
  justify-content: center;
  line-height: 24px;
  max-width: 100%;
  padding: 0 25px;
  position: relative;
  text-align: center;
  text-decoration: none;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button:after {
  background-color: #111;
  border-radius: 8px;
  content: "";
  display: block;
  height: 48px;
  left: 0;
  width: 100%;
  position: absolute;
  top: -2px;
  transform: translate(8px, 8px);
  transition: transform 0.2s ease-out;
  z-index: -1;
}

.button:hover:after {
  transform: translate(0, 0);
}

.button:active {
  background-color: #ffdeda;
  outline: 0;
}

.button:hover {
  outline: 0;
}

@media (min-width: 768px) {
  .button {
    padding: 0 40px;
  }
}
</style>
