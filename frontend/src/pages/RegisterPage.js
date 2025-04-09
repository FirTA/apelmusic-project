import {
  Container,
  TextField,
  Typography,
  Button,
  Dialog,
  Box,
  Alert,
  AlertTitle,
} from "@mui/material";
import React, { useState } from "react";
import { Link } from "react-router-dom";
import HeaderLogReg from "../components/HeaderLogReg";
import SetContextHeader from "../components/SetContextHeader";
import { APIRequest } from "../api/post";
import { useNavigate } from "react-router-dom";

function RegisterPage() {
  const [user, setUser] = useState({
    "nama user": "",
    email: "",
    password: "",
    "konfirmasi password": "",
  });
  const [message, setMessage] = useState({});
  const [errorField, setErrorField] = useState({});
  const [open, setOpen] = React.useState(false);
  const navigate = useNavigate();

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    navigate("/login");
  };

  // useEffect(() => {
  //   console.log("data state user :", user);
  // }, [user]);

  // useEffect(() => {
  //   console.log("data state error :", errorField);
  // }, [errorField]);

  // useEffect(() => {
  //   console.log("data state message :", message);
  // }, [message]);

  const emailValidFormat = (inputEmail) =>
    inputEmail.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)
      ? true
      : false;

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

  const isValidData = () =>
    Object.keys(errorField).every((value) => errorField[value] === false);

  const saveToDB = async () => {
    // let isRegister = true;
    Object.keys(user).forEach((value) => {
      // console.log(value, " : ", user[value]);
      if (user[value] === "") {
        handleErrorWithMsg(value, true, `${value} tidak boleh kosong!`);
      } else {
        handleErrorWithMsg(value, false, "");
      }
    });

    if (!isValidData()) {
      return;
    }

    let isEmailValidFormat = emailValidFormat(user.email);
    // console.log(user.email, " isValidEmail : ", isEmailValidFormat);

    if (!isEmailValidFormat) {
      handleErrorWithMsg("email", true, "format email salah!");
    } else {
      handleErrorWithMsg("email", false, "");

      // check email is register or not
      try {
        let response = await APIRequest.post("/User/checkemail", {
          email: user.email,
        });
        // console.log("response data: ", response.data);
        if (response.data === true) {
          // email sudah dipakai return error
          // isRegister = true;
          handleErrorWithMsg("email", true, "email sudah digunakan!");
          return;
        } else {
          // isRegister = false;
          handleErrorWithMsg("email", false, "");
        }
      } catch (error) {
        console.log("error on check email", error);
      }
    }

    const data = {
      nama_user: user["nama user"],
      email: user.email,
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

    // console.log("is valid data :", isValidData());
    if (isValidData()) {
      try {
        let response = await APIRequest.post("/User/Registration", data);
        // console.log("response registration :\n", response);
        handleClickOpen();
        // navigate("/login");
      } catch (error) {
        // console.log("error registration :\n", error);
      }
      return;
    } else {
      return;
    }

    // let formData = new FormData();
    // formData.append("nama_user", user.nama_user);
    // formData.append("email", user.email);
    // formData.append("password", user.password);

    // Axios({
    //   method: "POST",
    //   url: "/User/Registration",
    //   data: formData,
    //   headers: {
    //     "Content-Type": "multipart/form-data",
    //     // Authorization: AUTH_TOKEN,
    //   },
    // })
    //   .then((res) => {
    //     if (res.status === 200) {
    //       console.log("save success");
    //     }
    //   })
    //   .catch((err) => {
    //     console.log(err);
    //   });
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
          secondary={"Yuk daftar terlebih dahulu akun kamu"}
        />
        <Box
          sx={{
            flexDirection: "column",
            display: "flex",
            alignContent: "space-between",
          }}
        >
          <TextField
            id="nama user"
            placeholder="Masukan Nama Lengkap"
            sx={{ pb: 2 }}
            size="small"
            onChange={inputEvent}
            error={errorField["nama user"]}
            helperText={errorField["nama user"] ? message["nama user"] : null}
          ></TextField>
          <TextField
            id="email"
            placeholder="Masukan Email"
            sx={{ pb: 2 }}
            size="small"
            inputProps={{
              autoComplete: "new-password",
            }}
            onChange={inputEvent}
            error={errorField.email}
            helperText={errorField.email ? message.email : null}
          ></TextField>
          <TextField
            id="password"
            placeholder="Masukan Password"
            sx={{ pb: 2 }}
            size="small"
            autoComplete="new-password"
            type="password"
            onChange={inputEvent}
            error={errorField.password}
            helperText={errorField.password ? message.password : null}
          ></TextField>
          <TextField
            id="konfirmasi password"
            placeholder="Konfirmasi Password"
            sx={{ pb: 2 }}
            size="small"
            type="password"
            onChange={inputEvent}
            error={errorField["konfirmasi password"]}
            helperText={
              errorField["konfirmasi password"]
                ? message["konfirmasi password"]
                : null
            }
          ></TextField>
        </Box>
        <Box sx={{ display: "flex", alignItems: "center", pt: 3 }}>
          <Button
            variant="contained"
            sx={{ backgroundColor: "#5D5FEF" }}
            size="medium"
            onClick={saveToDB}
          >
            <Typography
              sx={{
                fontFamily: "poppins",
                fontSize: 15,
                textTransform: "none",
              }}
            >
              Daftar
            </Typography>
          </Button>
          <Typography sx={{ fontFamily: "poppins", fontSize: 16, px: 3 }}>
            Sudah punya akun?
            {
              <Link to="/login" style={{ textDecoration: "none" }}>
                {" "}
                Login disini
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
          <Alert severity="success" sx={{ fontFamily: "poppins" }}>
            <AlertTitle>Registrasi Berhasil</AlertTitle>
            Silahkan <strong>aktivasi</strong> akun anda dengan membuka link
            email yang kami kirim!
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

export default RegisterPage;
