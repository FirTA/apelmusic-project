import axios from "axios";

export default axios.create({
  baseURL:
    "https://apelmusic-api-eec4dkbcezejfhhz.indonesiacentral-01.azurewebsites.net/api",
});

export const APIRequest = axios.create({
  // baseURL: "http://localhost:8471/api",
  // baseURL: "http://52.237.194.35:2032/api",
  baseURL:
    "https://apelmusic-api-eec4dkbcezejfhhz.indonesiacentral-01.azurewebsites.net/api",
});

export const APIRequestWithHeaders = axios.create({
  // baseURL: "http://localhost:8471/api",
  // baseURL: "http://52.237.194.35:2032/api",
  baseURL:
    "https://apelmusic-api-eec4dkbcezejfhhz.indonesiacentral-01.azurewebsites.net/api",
  headers: {
    Authorization: localStorage.getItem("token")
      ? `Bearer ${localStorage.getItem("token")}`
      : "",
  },
});
