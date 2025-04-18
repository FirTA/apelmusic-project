import { axiosInstance } from "../api/post";

// Authentication
const login = (data) => axiosInstance.post("/User/login/", data);
const validateToken = (token) =>
  axiosInstance.post("/User/tokenidentity", { token });
const register = (data) => axiosInstance.post("/User/Registration", data);
const activateUser = (token) => axiosInstance.put(`/User/activation/${token}`);
const checkEmail = (email) => axiosInstance.post("/User/checkemail", { email });
const checkEmailReset = (email) =>
  axiosInstance.post("/User/checkemailreset", { email });
const resetPassword = (data) => axiosInstance.post("/User/resetpassword", data);

// Admin user management
const getAdmin = () => axiosInstance.get("/user/getadmin");
const insertAdmin = (data) => axiosInstance.post("/user/insertadmin", data);
const updateAdmin = (id, data) =>
  axiosInstance.put(`/user/updateadmin?id_user=${id}`, data);
const changeStatusAdmin = (id, status) =>
  axiosInstance.put(`/user/ChangeStatusAdmin?id_user=${id}`, { status });

const userServices = {
  login,
  validateToken,
  register,
  activateUser,
  checkEmail,
  checkEmailReset,
  resetPassword,
  getAdmin,
  insertAdmin,
  updateAdmin,
  changeStatusAdmin,
};

export default userServices;
