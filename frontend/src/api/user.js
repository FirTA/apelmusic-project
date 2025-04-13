import Axios from "axios";

export const APIRequest = Axios.create({
  // baseURL: "http://localhost:8471/api",
  baseURL: process.env.REACT_APP_API_URL,
});

const validateToken = (token) => {
  return APIRequest.post("/User/tokenidentity", { token: token });
};

export { validateToken };
