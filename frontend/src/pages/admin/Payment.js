import React, { useState, useEffect } from "react";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import Grid from "@mui/material/Grid";
import Switch from "@mui/material/Switch";
import Button from "@mui/material/Button";
import Dialog from "@mui/material/Dialog";
import DialogTitle from "@mui/material/DialogTitle";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import DialogActions from "@mui/material/DialogActions";
import TextField from "@mui/material/TextField";
import Box from "@mui/material/Box";
import SettingsIcon from "@mui/icons-material/Settings";
import { Container } from "@mui/system";
import { IconButton, Typography } from "@mui/material";
import Footer from "../../components/Footer";
import { APIRequest } from "../../api/post";

export default function Payment() {
  const [payments, setPayments] = useState([]);
  const [open, setOpen] = React.useState(false);
  const [formData, setFormData] = useState({
    nama: "",
  });
  const [imageBase64, setImageBase64] = useState("");
  const [isEdit, setIsEdit] = useState(false);
  const [idPaymentMethod, setIdPaymentMethod] = useState(0);
  const label = { inputProps: { "aria-label": "Switch demo" } };

  useEffect(() => {
    getPayment();
  }, []);

  const getPayment = async () => {
    try {
      const response = await APIRequest.get("/paymentmethod/getPayment");

      setPayments(response.data);
    } catch (err) {
      if (err.response) {
        console.log(err.response.data);
        console.log(err.response.status);
        console.log(err.response.headers);
      } else {
        console.log(`Error : ${err.message}`);
      }
    }
  };

  const handleSwitch = async (id_payment_method, status) => {
    const data = {
      status: !status,
    };

    try {
      let response = await APIRequest.put(
        "/paymentmethod/ChangeStatusPayment?id_payment_method=" +
          id_payment_method,
        data
      );

      getPayment();
    } catch (error) {
      console.log(error);
    }
  };

  const saveToDb = async () => {
    const data = {
      nama: formData.nama,
      logo: imageBase64,
    };

    try {
      let response = await APIRequest.post(
        "/paymentmethod/insertpayment",
        data
      );

      getPayment();
      setOpen(false);
    } catch (error) {
      console.log(error);
    }
  };

  const onPickImage = (e) => {
    //console.log(e.target.files[0]);
    const tempImage = e.target.files[0];
    // CONVERT KE BASE64
    let reader = new FileReader();

    reader.onload = function () {
      console.log("base64", reader.result);
      setImageBase64(reader.result);
    };
    reader.onerror = function (error) {
      console.log("Error: ", error);
    };

    reader.readAsDataURL(tempImage);
  };

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    setIsEdit(false);
  };

  function handleSetting(id_payment_method) {
    // console.log(id_payment_method);
    setOpen(true);
    setIsEdit(true);

    let payment = payments.filter(
      (payment) => payment.id_payment_method == id_payment_method
    );

    console.log(payment);
    setImageBase64(payment[0].logo);

    let data = { ...formData };
    data["nama"] = payment[0].nama;
    setFormData(data);
    setIdPaymentMethod(payment[0].id_payment_method);
  }

  const updateToDb = async () => {
    const data = {
      nama: formData.nama,
      logo: imageBase64,
    };

    try {
      let response = await APIRequest.put(
        "/paymentmethod/updatepayment?id_payment_method=" + idPaymentMethod,
        data
      );

      getPayment();
      setOpen(false);
    } catch (error) {
      console.log(error);
    }
  };

  function handleChange(e) {
    let data = { ...formData };
    data[e.target.name] = e.target.value;
    setFormData(data);
  }

  return (
    <>
      <Box align="center" sx={{ mb: 5, p: 2 }}>
        <Grid container spacing={4} maxWidth="md" sx={{ mt: 3 }}>
          <Grid
            item
            xs={6}
            sm={6}
            md={6}
            sx={{
              display: "flex",
              justifyContent: "flex-start",
            }}
          >
            <Typography variant="h5">List Payment Method</Typography>
          </Grid>
          <Grid
            item
            xs={6}
            sm={6}
            md={6}
            sx={{
              display: "flex",
              justifyContent: "flex-end",
            }}
          >
            <Button
              variant="contained"
              onClick={handleClickOpen}
              size="small"
              sx={{ textTransform: "none" }}
            >
              <Typography sx={{ fontSize: 12 }}>
                Tambah Payment Method
              </Typography>
            </Button>
          </Grid>
          <Grid item xs={12} sm={12} md={12}>
            <TableContainer component={Paper}>
              <Table
                sx={{
                  "& thead th:nth-child(1)": { width: "10%" },
                  // "& thead th:nth-child(2)": { width: "50%" },
                  "& thead th:nth-child(3)": { width: "10%" },
                  "& thead th:nth-child(4)": { width: "10%" },
                }}
                aria-label="simple table"
              >
                <TableHead>
                  <TableRow>
                    <TableCell>Status</TableCell>
                    <TableCell>Name</TableCell>
                    <TableCell>Logo</TableCell>
                    <TableCell>Action</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {payments.map((payment) => (
                    <TableRow
                      key={payment.id_payment_method}
                      sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
                    >
                      <TableCell align="center">
                        {payment.status ? (
                          <Switch
                            {...label}
                            defaultChecked
                            onChange={() =>
                              handleSwitch(
                                payment.id_payment_method,
                                payment.status
                              )
                            }
                          />
                        ) : (
                          <Switch
                            {...label}
                            onChange={() =>
                              handleSwitch(
                                payment.id_payment_method,
                                payment.status
                              )
                            }
                          />
                        )}
                      </TableCell>
                      <TableCell component="th" scope="row">
                        {payment.nama}
                      </TableCell>
                      <TableCell align="center">
                        <img src={payment.logo} height="20px" />
                      </TableCell>
                      <TableCell align="center">
                        <IconButton
                          aria-label="setting"
                          onClick={() =>
                            handleSetting(payment.id_payment_method)
                          }
                        >
                          <SettingsIcon />
                        </IconButton>
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          </Grid>
        </Grid>
      </Box>

      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>
          {isEdit ? "Edit Payment Method" : "Tambah Payment Method"}
        </DialogTitle>
        <DialogContent>
          <DialogContentText sx={{ mb: 3 }}>
            Silakan lengkapi isi form
          </DialogContentText>
          <TextField
            id="nama"
            name="nama"
            label="Nama Payment"
            variant="outlined"
            fullWidth
            type="text"
            value={formData.nama}
            onChange={handleChange}
            sx={{ mb: 3 }}
            focused
          />
          <TextField
            id="logo"
            name="logo"
            variant="outlined"
            fullWidth
            type="file"
            onChange={onPickImage}
            sx={{ mb: 3 }}
          />
          <img
            src={imageBase64}
            alt="logo image"
            style={{ maxWidth: "150px" }}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>Cancel</Button>

          {isEdit ? (
            <Button onClick={updateToDb} variant="contained">
              Edit
            </Button>
          ) : (
            <Button onClick={saveToDb} variant="contained">
              Tambah
            </Button>
          )}
        </DialogActions>
      </Dialog>

      <Footer />
    </>
  );
}
