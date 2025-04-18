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
import { useNavigate, useParams } from "react-router-dom";
import HeaderLogReg from "../components/HeaderLogReg";
import SetContextHeader from "../components/SetContextHeader";
import React, { useState } from "react";
import userServices from "../services/userServices";

function ResetPasswordPage() {
  // const { state } = useLocation();
  const { token } = useParams();
  const navigate = useNavigate();

  const [user, setUser] = useState({});
  const [message, setMessage] = useState({});
  const [errorField, setErrorField] = useState({});

  const [open, setOpen] = React.useState(false);
  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    navigate("/login");
  };

  const handleBatal = () => navigate("/home");

  const handleErrorWithMsg = (key, isError, msg) => {
    // console.log("Error message...");
    setErrorField((prevValue) => {
      return { ...prevValue, [key]: isError };
    });
    setMessage((prevValue) => {
      return { ...prevValue, [key]: msg };
    });
  };

  // useEffect(() => {
  //   console.log("token : ", token);
  //   setUser((prevValue) => {
  //     return { ...prevValue, token: token };
  //   });
  // }, [token]);

  const inputEvent = (e) => {
    const { id, value } = e.target;
    setUser((prevValue) => {
      return { ...prevValue, [id]: value };
    });

    if (value === "") {
      handleErrorWithMsg(id, true, `${id} tidak boleh kosong!`);
    } else {
      handleErrorWithMsg(id, false, "");
    }

    if (id === "password" && value.length < 6) {
      handleErrorWithMsg(id, true, `${id} minimal 6 charachter!`);
    } else {
      handleErrorWithMsg(id, false, "");
    }
  };

  const resetPwd = async () => {
    const data = {
      token: token,
      password: user.password,
    };
    if (user.password !== user["konfirmasi password"]) {
      handleErrorWithMsg(
        "konfirmasi password",
        true,
        "Konfirmasi password berbeda!"
      );
      return;
    } else {
      handleErrorWithMsg("konfirmasi password", false, "");
    }

    try {
      await userServices.resetPassword(data);
      handleClickOpen();
    } catch (err) {
      console.Error("Error during reset password:", err);
    }
  };

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
        <HeaderLogReg primary={"Buat Password"} secondary={""} />
        <Box
          sx={{
            flexDirection: "column",
            display: "flex",
            alignContent: "space-between",
          }}
        >
          <TextField
            id="password"
            placeholder="Password Baru"
            sx={{ pb: 2 }}
            size="small"
            // value={user.password ? user.password : ""}
            inputProps={{
              autoComplete: "new-password",
            }}
            onChange={inputEvent}
            type="password"
            error={errorField.password}
            helperText={errorField.password ? message.password : null}
          ></TextField>
          <TextField
            id="konfirmasi password"
            placeholder="Konfirmasi Password Baru"
            sx={{ pb: 2 }}
            size="small"
            type="password"
            error={errorField["konfirmasi password"]}
            helperText={
              errorField["konfirmasi password"]
                ? message["konfirmasi password"]
                : null
            }
            onChange={inputEvent}
          ></TextField>
        </Box>
        <Box>
          <Button
            variant="contained"
            sx={{ backgroundColor: "#5D5FEF", my: 2, mr: 2, px: 3 }}
            size="medium"
            onClick={handleBatal}
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

          <Button
            variant="outlined"
            sx={{
              backgroundColor: "white",
              my: 2,
              px: 3,
              color: "#5D5FEF",
              borderColor: "#5D5FEF",
            }}
            size="medium"
            onClick={
              resetPwd
              //   () => {
              //   if (data.password === data.ccpassword) {
              //     resetPwd();
              //   } else {
              //     alert("Confirm password is different");
              //   }
              // }
            }
          >
            <Typography
              sx={{
                fontFamily: "poppins",
                fontSize: 15,
                textTransform: "none",
              }}
            >
              Kirim
            </Typography>
          </Button>
        </Box>
        <Dialog
          open={open}
          // TransitionComponent={Transition}
          keepMounted
          onClose={handleClose}
          aria-describedby="alert-dialog-slide-description"
        >
          <Alert severity="success" sx={{ fontFamily: "poppins" }}>
            <AlertTitle>Reset Password Berhasil</AlertTitle>
            Silahkan login dengan password baru anda!
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

export default ResetPasswordPage;
