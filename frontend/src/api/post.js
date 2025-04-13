import axios from "axios";

export default axios.create({
  baseURL: "https://apelmusic-project-api.vercel.app/api",
});

export const APIRequest = axios.create({
  // baseURL: "http://localhost:8471/api",
  // baseURL: "http://52.237.194.35:2032/api",
  baseURL: "https://apelmusic-project-api.vercel.app/api",
});

export const APIRequestWithHeaders = axios.create({
  // baseURL: "http://localhost:8471/api",
  // baseURL: "http://52.237.194.35:2032/api",
  baseURL: "https://apelmusic-project-api.vercel.app/api",
  headers: {
    Authorization: localStorage.getItem("token")
      ? `Bearer ${localStorage.getItem("token")}`
      : "",
  },
});
