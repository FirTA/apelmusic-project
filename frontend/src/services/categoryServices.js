import { axiosInstance } from "../api/post";

const getCategory = () => axiosInstance.get("/Category/getacategory");
const getCategoryById = (id) =>
  axiosInstance.get(`/category/getcategory/${id}`);

const categoryServices = { getCategory, getCategoryById };
export default categoryServices;
