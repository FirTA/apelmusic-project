import {
  Container,
  TextField,
  Typography,
  Button,
  Dialog,
  Alert,
  AlertTitle,
  Box,
} from "@mui/material";
import { Link as RouterLink, useNavigate } from "react-router-dom";
import HeaderLogReg from "../components/HeaderLogReg";
import React, { useState, useEffect } from "react";
import SetContextHeader from "../components/SetContextHeader";
import userServices from "../services/userServices";

function ResetPasswordConfirmEmail() {
  const [email, setEmail] = useState();
  const [isRegistered, setIsRegistered] = useState();
  const [isError, setIsError] = useState(false);
  const [errMessage, setErrMessage] = useState("");
  const [open, setOpen] = React.useState(false);
  const navigate = useNavigate();

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    navigate("/login");
  };

  const inputEvent = (e) => {
    const { id, value } = e.target;
    setEmail(value);
  };
  const emailValidFormat = (inputEmail) =>
    inputEmail.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)
      ? true
      : false;

  const checkEmail = async () => {
    const data = { email: email };
    let isEmailFormat = emailValidFormat(data.email);
    if (isEmailFormat) {
      try {
        console.log(data);
        let response = await userServices.checkEmailReset(data);
        setIsRegistered(response.data);
        if (response.data === false) {
          setIsError(true);
          setErrMessage("Email tidak terdaftar!");
        }
        if (response.data) {
          setIsError(false);
          handleClickOpen();
          // navigate("/login");
        }
      } catch (err) {
        console.error("Error during checking email:", err);
        setIsError(true);
        setErrMessage(err.response.data);
      }
    } else {
      setIsError(true);
      setErrMessage("email format salah!");
    }
  };

  useEffect(() => {
    console.log("isError : ", isError);
  }, [isError]);

  useEffect(() => {
    console.log("email terdaftar : ", isRegistered);
  }, [isRegistered]);
  return (
    <>
      <SetContextHeader />
      <Container
        sx={{
          display: "flex",
          flexDirection: "column",
          justifyContent: "center",
        }}
        maxWidth="sm"
      >
        <HeaderLogReg
          primary={"Reset Password"}
          secondary={"silahkan masukan terlebih dahulu email anda"}
        />
        <Box
          sx={{
            flexDirection: "column",
            display: "flex",
            alignContent: "space-between",
          }}
        >
          <TextField
            id="email"
            placeholder="Masukan Email"
            sx={{ mb: 1 }}
            size="small"
            onChange={inputEvent}
            error={isError}
            helperText={errMessage}
          ></TextField>
        </Box>
        <Box>
          <Button
            variant="outlined"
            sx={{
              backgroundColor: "white",
              my: 2,
              mr: 2,
              color: "#5D5FEF",
              borderColor: "#5D5FEF",
            }}
            size="medium"
          >
            <Typography
              sx={{
                fontFamily: "poppins",
                fontSize: 15,
                textTransform: "none",
              }}
            >
              Batal
            </Typography>
          </Button>
          <RouterLink
            to="#"
            state={{
              email: email,
            }}
            style={{ textDecoration: "none" }}
          >
            <Button
              variant="contained"
              sx={{
                backgroundColor: "#5D5FEF",
                textDecoration: "none",
              }}
              onClick={checkEmail}
            >
              <Typography
                sx={{
                  fontFamily: "poppins",
                  textTransform: "none",
                  fontSize: 16,
                }}
              >
                Konfirmasi
              </Typography>
            </Button>
          </RouterLink>
        </Box>

        <Dialog
          open={open}
          // TransitionComponent={Transition}
          keepMounted
          onClose={handleClose}
          aria-describedby="alert-dialog-slide-description"
        >
          <Alert severity="success" sx={{ fontFamily: "poppins" }}>
            <AlertTitle>Email Konfirmasi</AlertTitle>
            Silahkan reset password akun anda dengan membuka link yang kami
            kirim ke email anda!
            <Box sx={{ display: "flex", justifyContent: "flex-end" }}>
              <Button color="inherit" size="small" onClick={handleClose}>
                ok
              </Button>
            </Box>
          </Alert>
        </Dialog>
      </Container>
    </>
  );
}

export default ResetPasswordConfirmEmail;
