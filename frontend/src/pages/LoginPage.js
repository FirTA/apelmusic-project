import {
  Container,
  TextField,
  Typography,
  Dialog,
  Alert,
  AlertTitle,
  Button,
  Box,
} from "@mui/material";
import React, { useState, useEffect } from "react";
import { NavLink, Link } from "react-router-dom";
import Header from "../components/Header";
import HeaderLogReg from "../components/HeaderLogReg";
import SetContextHeader from "../components/SetContextHeader";
import { APIRequest } from "../api/post";
import { useNavigate } from "react-router-dom";
import useAuth from "../hooks/useAuth";

function LoginPage() {
  const { auth, setAuth } = useAuth();
  const [user, setUser] = useState({ email: "", password: "" });
  const navigate = useNavigate();
  const [open, setOpen] = useState(false);

  const [response, setResponse] = useState();
  const [responseMsg, setResponseMsg] = useState();
  const [message, setMessage] = useState({});
  const [errorField, setErrorField] = useState({});

  // handle error dari text Field
  const handleErrorWithMsg = (key, isError, msg) => {
    // console.log("Error message...");
    setErrorField((prevValue) => {
      return { ...prevValue, [key]: isError };
    });
    setMessage((prevValue) => {
      return { ...prevValue, [key]: msg };
    });
  };

  const inputEvent = (e) => {
    const { id, value } = e.target;
    setUser((prevValue) => {
      return { ...prevValue, [id]: value };
    });
    if (value === "") {
      handleErrorWithMsg(id, true, `${id} is required!`);
    } else {
      handleErrorWithMsg(id, false, "");
    }
  };

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    if (localStorage.getItem("role") === "peserta") {
      navigate("/home");
    } else if (localStorage.getItem("role") === "admin") {
      navigate("/user");
    }
  };

  // useEffect(() => {
  //   console.log("data state user :", user);
  // }, [user]);

  // useEffect(() => {
  //   console.log("data state user onOpen page :", user);
  //   // localStorage.clear();
  // }, []);

  const loginUser = async () => {
    const data = {
      email: user.email,
      password: user.password,
    };
    try {
      let response = await APIRequest.post("/User/login/", data);
      // console.log(response);
      localStorage.setItem("id_user", response.data.id_user);
      localStorage.setItem("nama_user", response.data.nama_user);
      localStorage.setItem("email", response.data.email);
      localStorage.setItem("role", response.data.role);
      localStorage.setItem("token", response.data.token);
      setResponse("success");
      setAuth(response.data);
      APIRequest.defaults.headers.common[
        "Authorization"
      ] = `Bearer ${response.data.token}`;
      handleClickOpen();

      // pindah di handle close dialog
      // if (response.data.role === "peserta") {
      //   navigate("/home");
      // } else if (response.data.role === "admin") {
      //   navigate("/user");
      // }
    } catch (error) {
      setResponse("error");
      setResponseMsg(error.response.data);
      console.log("Error Login :\n", error);
      console.log("Error data :\n", error.response.data);
      handleClickOpen();
      // alert(error.response.data);
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
        <HeaderLogReg
          primary={"Selamat Datang Musikers!"}
          secondary={"Login dulu yuk"}
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
            value={user.email ? user.email : ""}
            onChange={inputEvent}
            error={errorField.email}
            helperText={message.email}
          ></TextField>
          <TextField
            id="password"
            placeholder="Masukan Password"
            sx={{}}
            size="small"
            value={user.password ? user.password : ""}
            inputProps={{
              autoComplete: "new-password",
            }}
            onChange={inputEvent}
            type="password"
            error={errorField.email}
            helperText={message.email}
          ></TextField>
          <Box sx={{ display: "flex", flexDirection: "row-reverse" }}>
            <Link
              to="/resetpassword-emailconfirm"
              style={{ textDecoration: "none" }}
            >
              <Typography
                sx={{
                  fontFamily: "poppins",
                  fontSize: 14,
                  color: "#4F4F4F",
                  mt: 3,
                }}
              >
                Lupa kata sandi?
              </Typography>
            </Link>
          </Box>
        </Box>
        <Box>
          <Button
            variant="contained"
            sx={{ backgroundColor: "#5D5FEF", mb: 3 }}
            size="medium"
            onClick={loginUser}
          >
            <Typography
              sx={{
                fontFamily: "poppins",
                fontSize: 15,
                textTransform: "none",
              }}
            >
              Masuk
            </Typography>
          </Button>
          <Typography sx={{ fontFamily: "poppins", fontSize: 16 }}>
            Belum punya akun?
            {
              <Link to="/register" style={{ textDecoration: "none" }}>
                {" "}
                Daftar disini
              </Link>
            }
          </Typography>
        </Box>

        <Dialog
          open={open}
          // TransitionComponent={Transition}
          keepMounted
          onClose={handleClose}
          aria-describedby="alert-dialog-slide-description"
        >
          {response === "success" ? (
            <Alert severity="success" sx={{ fontFamily: "poppins" }}>
              <AlertTitle>Login Berhasil</AlertTitle>
              Selamat datang{" "}
              <strong>{localStorage.getItem("nama_user")}</strong>, happy
              learning
              <Box sx={{ display: "flex", justifyContent: "flex-end" }}>
                <Button color="inherit" size="small" onClick={handleClose}>
                  ok
                </Button>
              </Box>
            </Alert>
          ) : (
            <Alert severity="error" sx={{ fontFamily: "poppins" }}>
              <AlertTitle>Login Gagal</AlertTitle>
              {responseMsg}
              <Box sx={{ display: "flex", justifyContent: "flex-end" }}>
                <Button color="inherit" size="small" onClick={handleClose}>
                  ok
                </Button>
              </Box>
            </Alert>
          )}
        </Dialog>
      </Container>
    </>
  );
}

export default LoginPage;
