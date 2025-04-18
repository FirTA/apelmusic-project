import { axiosInstance } from "../api/post";

const getPayment = () => axiosInstance.get("/paymentmethod/getPayment");

const getActivePayments = () =>
  axiosInstance.get("/paymentmethod/getPayment").then((response) => {
    return response.data.filter((payment) => payment.status === true);
  });

const insertPayment = (data) =>
  axiosInstance.post("/paymentmethod/insertpayment", data);

const updatePayment = (id, data) =>
  axiosInstance.put(
    `/paymentmethod/updatepayment?id_payment_method=${id}`,
    data
  );

const changeStatusPayment = (id, status) =>
  axiosInstance.put(
    `/paymentmethod/ChangeStatusPayment?id_payment_method=${id}`,
    { status }
  );

const paymentServices = {
  getPayment,
  getActivePayments,
  insertPayment,
  updatePayment,
  changeStatusPayment,
};

export default paymentServices;
