import { axiosInstance } from "../api/post";

const getInvoice = (userId = null) => {
  if (userId) {
    return axiosInstance.get(`/invoice/getInvoice?id_user=${userId}`);
  }
  return axiosInstance.get("/invoice/getInvoice");
};

const getDetailInvoice = (invoiceId) =>
  axiosInstance.get(`/invoice/getDetailInvoice?id_invoice=${invoiceId}`);

const addInvoice = (data) => axiosInstance.post("/invoice/addinvoice", data);

const invoiceServices = {
  getInvoice,
  getDetailInvoice,
  addInvoice,
};

export default invoiceServices;
