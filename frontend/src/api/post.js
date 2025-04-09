import axios from "axios";

export default axios.create({
  baseURL: "http://localhost:8471",
});

export const APIRequest = axios.create({
  baseURL: "http://localhost:8471/api",
  // baseURL: "http://52.237.194.35:2032/api",
  // baseURL: `${process.env.REACT_APP_BASE_URL}`,
});

export const APIRequestWithHeaders = axios.create({
  baseURL: "http://localhost:8471/api",
  // baseURL: "http://52.237.194.35:2032/api",
  // baseURL: `${process.env.REACT_APP_BASE_URL}`,
  headers: {
    Authorization: localStorage.getItem("token")
      ? `Bearer ${localStorage.getItem("token")}`
      : "",
  },
});
