import Axios from "axios";

export const APIRequest = Axios.create({
  // baseURL: "http://localhost:8471/api",
  baseURL:
    "https://apelmusic-api-eec4dkbcezejfhhz.indonesiacentral-01.azurewebsites.net/api",
});

const validateToken = (token) => {
  return APIRequest.post("/User/tokenidentity", { token: token });
};

export { validateToken };
