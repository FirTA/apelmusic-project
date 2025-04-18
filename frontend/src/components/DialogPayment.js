import {
  Button,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Typography,
} from "@mui/material";
import React, { useState, useEffect } from "react";
import AccountCircleIcon from "@mui/icons-material/AccountCircle";
import EmailIcon from "@mui/icons-material/Email";
import Dialog from "@mui/material/Dialog";
import DialogActions from "@mui/material/DialogActions";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import DialogTitle from "@mui/material/DialogTitle";
import Slide from "@mui/material/Slide";
import apiExport from "../api/post";
import { Box } from "@mui/system";
import { PaymentTwoTone } from "@mui/icons-material";
import paymentServices from "../services/paymentServices";

const Transition = React.forwardRef(function Transition(props, ref) {
  return <Slide direction="up" ref={ref} {...props} />;
});

export default function DialogPayment({
  open,
  onClose,
  setIdPayment,
  saveToDb,
}) {
  const namaUser = localStorage.getItem("nama_user");
  const email = localStorage.getItem("email");
  const [selectedPayment, setSelectedPayment] = useState(null);
  const [payments, setPayments] = useState([]);

  useEffect(() => {
    if (open) getPayment();
  }, [open]);

  const getPayment = async () => {
    try {
      const payments = await paymentServices.getActivePayments();
      setPayments(payments);
    } catch (err) {
      console.error("Error fetching active payment methods:", err);
    }
  };
  const handleSelectPayment = (index) => {
    setSelectedPayment(index);
    setIdPayment(index);
  };

  return (
    <>
      <Dialog
        open={open}
        TransitionComponent={Transition}
        keepMounted
        onClose={onClose}
        aria-describedby="alert-dialog-slide-description"
        scroll="paper"
      >
        <DialogTitle sx={{ fontFamily: "Poppins" }}>
          <center>Pilih Metode Pembayaran</center>
        </DialogTitle>
        <DialogContent sx={{ maxHeight: "400px" }}>
          {payments.map((payment) => (
            <>
              <ListItemButton
                sx={{
                  backgroundColor:
                    selectedPayment === payment.id_payment_method
                      ? "#7F7F7F"
                      : "white",
                }}
                onClick={() => handleSelectPayment(payment.id_payment_method)}
              >
                <ListItemIcon>
                  <img src={payment.logo} width="20px" alt={payment.nama} />
                </ListItemIcon>
                <ListItemText primary={payment.nama} />
              </ListItemButton>
            </>
          ))}
        </DialogContent>
        <Box sx={{ p: 1 }}>
          <center>
            <Button variant="outlined" onClick={onClose} sx={{ mr: 3 }}>
              <Typography
                sx={{
                  fontFamily: "poppins",
                  textTransform: "none",
                  fontSize: 16,
                }}
              >
                Batal
              </Typography>
            </Button>
            <Button
              variant="contained"
              disabled={selectedPayment === null}
              sx={{
                backgroundColor: "#5D5FEF",
                textDecoration: "none",
              }}
              onClick={saveToDb}
            >
              <Typography
                sx={{
                  fontFamily: "poppins",
                  textTransform: "none",
                  fontSize: 16,
                }}
              >
                Bayar
              </Typography>
            </Button>
          </center>
        </Box>
      </Dialog>
    </>
  );
}
