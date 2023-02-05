<template>
  <div class="hello"></div>
  <hr />
  <div>
    <div></div>
    <div class="container mt-3">
      <form @submit="submit">
        <div class="row">
          <div class="col-10">
            <h1>{{ $t("title") }}</h1>
          </div>
          <div class="col-2">
            <a v-if="$i18n.locale !== 'vn'" v-on:click="changeLanguage('vn')"
              >VN</a
            >
            <strong v-if="$i18n.locale === 'vn'">VN</strong>
            &nbsp;|&nbsp;
            <a v-if="$i18n.locale !== 'en'" v-on:click="changeLanguage('en')"
              >EN</a
            >
            <strong v-if="$i18n.locale === 'en'">EN</strong>
          </div>
          <div class="col-4">
            <div class="row">
              <div class="col-12 mt-2">
                <label for="firstName">{{ $t("first_name") }}</label>
              </div>
              <div class="col-12 mt-2">
                <input
                  :class="{
                    error: firstNameError,
                    success: firstNameMeta.valid,
                  }"
                  class="input"
                  type="text"
                  name="firstName"
                  id="firstName"
                  v-model="firstName"
                />
              </div>
              <div class="col-12 mt-2">
                <p v-if="firstNameMeta.valid" class="text-success">
                  {{ $t("success") }}
                </p>
                <p v-else class="text-error">
                  {{ firstNameError ? $t(firstNameError) : null }}
                </p>
              </div>
            </div>
          </div>
          <div class="col-4">
            <div class="row">
              <div class="col-12 mt-2">
                <label for="lastName">{{ $t("last_name") }}</label>
              </div>
              <div class="col-12 mt-2">
                <input
                  :class="{ error: lastNameError, success: lastNameMeta.valid }"
                  class="input"
                  type="text"
                  name="lastName"
                  id="lastName"
                  v-model="lastName"
                />
              </div>
              <div class="col-12 mt-2">
                <p v-if="lastNameMeta.valid" class="text-success">
                  {{ $t("success") }}
                </p>
                <p v-else class="text-error">
                  {{ lastNameError ? $t(lastNameError) : null }}
                </p>
              </div>
            </div>
          </div>
          <div class="col-4">
            <div class="row">
              <div class="col-12 mt-2">
                <label for="email">{{ $t("email") }}</label>
              </div>
              <div class="col-12 mt-2">
                <input
                  :class="{ error: emailError, success: emailMeta.valid }"
                  class="input"
                  type="text"
                  name="email"
                  id="email"
                  v-model="email"
                />
              </div>
              <div class="col-12 mt-2">
                <p v-if="emailMeta.valid" class="text-success">
                  {{ $t("success") }}
                </p>
                <p v-else class="text-error">
                  {{ emailError ? $t(emailError) : null }}
                </p>
              </div>
            </div>
          </div>
          <div class="col-4">
            <div class="row">
              <div class="col-12 mt-2">
                <label for="phone">{{ $t("phone") }}</label>
              </div>
              <div class="col-12 mt-2">
                <input
                  :class="{ error: phoneError, success: phoneMeta.valid }"
                  class="input"
                  type="text"
                  name="phone"
                  id="phone"
                  v-model="phone"
                />
              </div>
              <div class="col-12 mt-2">
                <p v-if="phoneMeta.valid" class="text-success">
                  {{ $t("success") }}
                </p>
                <p v-else class="text-error">
                  {{ phoneError ? $t(phoneError) : null }}
                </p>
              </div>
            </div>
          </div>
          <div class="col-8">
            <div class="row">
              <div class="col-12 mt-2">{{ $t("gender") }}</div>
              <div class="col-4 mt-2">
                <input
                  :class="{ error: genderIdError, success: genderIdMeta.valid }"
                  type="radio"
                  name="genderId"
                  id="3"
                  v-model="genderId"
                  value="Undefine"
                />{{ $t("Undefine") }}
              </div>
              <div class="col-4 mt-2">
                <input
                  :class="{ error: genderIdError, success: genderIdMeta.valid }"
                  type="radio"
                  name="genderId"
                  id="2"
                  v-model="genderId"
                  value="Female"
                />{{ $t("Male") }}
              </div>
              <div class="col-4 mt-2">
                <input
                  :class="{ error: genderIdError, success: genderIdMeta.valid }"
                  type="radio"
                  name="genderId"
                  id="1"
                  v-model="genderId"
                  value="Male"
                />{{ $t("Female") }}
              </div>
              <div class="col-12 mt-2">
                <p v-if="genderIdMeta.valid" class="text-success">
                  {{ $t("success") }}
                </p>
                <p v-else class="text-error">
                  {{ genderIdError ? $t(genderIdError) : null }}
                </p>
              </div>
            </div>
          </div>
          <div class="col-4">
            <div class="row">
              <div class="col-12 mt-2">{{ $t("province") }}</div>
              <div class="col-12 mt-2">
                <select
                  @change="getDis"
                  v-model="provincesId"
                  class="input"
                  :class="{
                    error: provincesIdError,
                    success: provincesIdMeta.valid,
                  }"
                >
                  <option
                    v-for="province in address"
                    :key="province.level1_id"
                    :value="province.level1_id"
                  >
                    {{ province.name }}
                  </option>
                </select>
              </div>
              <div class="col-12 mt-2">
                <p v-if="provincesIdMeta.valid" class="text-success">
                  {{ $t("success") }}
                </p>
                <p v-else class="text-error">
                  {{ provincesIdError ? $t(provincesIdError) : null }}
                </p>
              </div>
            </div>
          </div>

          <div class="col-4">
            <div class="row">
              <div class="col-12 mt-2">
                {{ $t("district") }}
              </div>
              <div class="col-12 mt-2">
                <select
                  @change="getWardId"
                  v-model="districtsId"
                  class="input"
                  :class="{
                    error: districtsIdError,
                    success: districtsIdMeta.valid,
                  }"
                >
                  <option
                    v-for="district in dis"
                    :key="district.level2_id"
                    :value="district.level2_id"
                  >
                    {{ district.name }}
                  </option>
                </select>
              </div>
              <div class="col-12 mt-2">
                <p v-if="districtsIdMeta.valid" class="text-success">
                  {{ $t("success") }}
                </p>
                <p v-else class="text-error">
                  {{ districtsIdError ? $t(districtsIdError) : null }}
                </p>
              </div>
            </div>
          </div>

          <div class="col-4">
            <div class="row">
              <div class="col-12 mt-2">{{ $t("ward") }}</div>
              <div class="col-12 mt-2">
                <select
                  @change="getWard"
                  v-model="wardId"
                  class="input"
                  :class="{ error: wardIdError, success: wardIdMeta.valid }"
                >
                  <option
                    v-for="wardId in ward"
                    :key="wardId.level3_id"
                    :value="wardId.level3_id"
                  >
                    {{ wardId.name }}
                  </option>
                </select>
              </div>
              <div class="col-12 mt-2">
                <p v-if="wardIdMeta.valid" class="text-success">
                  {{ $t("success") }}
                </p>
                <p v-else class="text-error">
                  {{ wardIdError ? $t(wardIdError) : null }}
                </p>
              </div>
            </div>
          </div>

          <div class="col-12">
            <button class="button" type="submit">
              {{ $t("submit") }}
            </button>
          </div>
        </div>
      </form>
      <br />
    </div>
    <br />
  </div>
</template>

<script>
import axios from "axios";
import { useForm, useField } from "vee-validate";
import * as yup from "yup";
import { ref } from "@vue/reactivity";
import { useRouter } from "vue-router";
export default {
  name: "InputForm",
  methods: {
    changeLanguage(lang) {
      this.$i18n.locale = lang;
    },
  },
  emits: ["user"],
  setup() {
    const router = useRouter();
    axios
      .get("dvhcvn.json")
      .then((response) => {
        address.value = response.data.data;
      })
      .catch((error) => {
        console.log("there was an error:" + error.response);
      });
    const schema = yup.object({
      firstName: yup.string().min(2).max(15).required(),
      lastName: yup.string().min(2).max(15).required(),
      email: yup.string().email().required(),
      phone: yup.string().min(9).required(),
      genderId: yup.string().required(),
      provincesId: yup.string().required(),
      districtsId: yup.string().required(),
      wardId: yup.string().required(),
    });
    useForm({
      validationSchema: schema,
    });
    const {
      value: firstName,
      errorMessage: firstNameError,
      meta: firstNameMeta,
    } = useField("firstName");
    const {
      value: lastName,
      errorMessage: lastNameError,
      meta: lastNameMeta,
    } = useField("lastName");
    const {
      value: email,
      errorMessage: emailError,
      meta: emailMeta,
    } = useField("email");
    const {
      value: phone,
      errorMessage: phoneError,
      meta: phoneMeta,
    } = useField("phone");
    const {
      value: genderId,
      errorMessage: genderIdError,
      meta: genderIdMeta,
    } = useField("genderId");
    const {
      value: districtsId,
      errorMessage: districtsIdError,
      meta: districtsIdMeta,
    } = useField("districtsId");
    const {
      value: provincesId,
      errorMessage: provincesIdError,
      meta: provincesIdMeta,
    } = useField("provincesId");
    const {
      value: wardId,
      errorMessage: wardIdError,
      meta: wardIdMeta,
    } = useField("wardId");

    const { handleSubmit } = useForm();
    const isShow = ref(false);
    const showChange = function () {
      isShow.value = !isShow.value;
    };
    const submit = handleSubmit(() => {
      for (let i = 0; i < dataValid.length; i++) {
        if (dataValid[i].value == undefined) {
          dataValid[i].value = "";
        }
      }
      isShow.value =
        dataValid.every((item) => item.value !== "") &&
        dataError.every((item) => item.value === undefined);
      //   emit("user", user);
      if (isShow.value) {
        router.push({
          name: "show_page",
          query: {
            first_name: firstName.value,
            last_name: lastName.value,
            email: email.value,
            phone: phone.value,
            gender: genderId.value,
            province: province.value,
            district: district.value,
            ward: wardName.value,
          },
        });
      }
    });

    const getDis = () => {
      districtsId.value = undefined;
      wardId.value = undefined;
      ward.value = undefined;
      province.value = address.value.filter((el) => {
        return el.level1_id === provincesId.value;
      })[0].name;
      dis.value = address.value.filter((el) => {
        return el.level1_id === provincesId.value;
      })[0].level2s;
    };
    const getWardId = () => {
      wardId.value = undefined;
      district.value = dis.value.filter((el) => {
        return el.level2_id === districtsId.value;
      })[0].name;
      ward.value = dis.value.filter((el) => {
        return el.level2_id === districtsId.value;
      })[0].level3s;
    };
    const getWard = () => {
      wardName.value = ward.value.filter((el) => {
        return el.level3_id === wardId.value;
      })[0].name;
    };

    const address = ref();
    const dis = ref();
    const ward = ref();
    const district = ref();
    const province = ref();
    const wardName = ref();
    const user = {
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      genderId: genderId,
      districtsId: district,
      provincesId: province,
      wardId: wardName,
      showForm: isShow,
    };

    const dataError = [
      firstNameError,
      lastNameError,
      emailError,
      phoneError,
      genderIdError,
      districtsIdError,
      provincesIdError,
      wardIdError,
    ];

    const dataValid = [
      firstName,
      lastName,
      email,
      phone,
      genderId,
      districtsId,
      provincesId,
      wardId,
    ];
    return {
      ward,
      dis,
      address,
      getWard,
      getWardId,
      getDis,
      district,
      province,
      wardName,
      showChange,
      dataError,
      user,
      isShow,
      submit,
      dataValid,
      schema,
      firstName,
      firstNameError,
      firstNameMeta,
      lastName,
      lastNameError,
      lastNameMeta,
      email,
      emailError,
      emailMeta,
      phone,
      phoneError,
      phoneMeta,
      genderId,
      genderIdError,
      genderIdMeta,
      districtsId,
      districtsIdError,
      districtsIdMeta,
      provincesId,
      provincesIdError,
      provincesIdMeta,
      wardId,
      wardIdError,
      wardIdMeta,
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
.input {
  width: 200px;
}

.text-success {
  color: green;
}

.text-error {
  color: red;
}

.input.success {
  border-color: rgb(112, 236, 112);
}

.input.error {
  border-color: red;
}

.success {
  border-color: rgb(112, 236, 112);
}

.error {
  border-color: red;
}

.show {
  width: 500px;
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
