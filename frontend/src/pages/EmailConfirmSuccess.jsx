import { Container, Typography, Button } from "@mui/material";
import React from "react";
import pic from "../assets/email_success.png";
import { Link as RouterLink, useParams } from "react-router-dom";
import { HeaderContext } from "../context/HeaderContext";
import { useContext, useEffect } from "react";
import SetContextHeader from "../components/SetContextHeader";
import userServices from "../services/userServices";

function EmailConfirmSuccess() {
  const { updateHeader } = useContext(HeaderContext);
  const { header } = useContext(HeaderContext);
  const { token } = useParams();

  useEffect(() => {
    updateHeader({
      variant: header.variant,
      backgroundColor: "#ffffff",
    });
  }, []);

  // React.useEffect(() => {
  //   console.log(token);
  // }, [token]);

  useEffect(() => {
    activateUser(token);
  }, []);

  const activateUser = async (token) => {
    try {
      await userServices.activateUser(token);
    } catch (err) {
      console.error("Error during activation user ", err);
    }
  };

  return (
    <>
      <SetContextHeader />
      <Container
        sx={{
          display: "flex",
          justifyContent: "center",
          flexDirection: "column",
          alignItems: "center",
        }}
        maxWidth="sm"
      >
        <img
          src={pic}
          alt="email"
          width="250"
          height="250"
          style={{ margin: 30 }}
        />
        <Typography
          sx={{
            fontFamily: "poppins",
            fontStyle: "normal",
            lineHeight: "36px",
            fontSize: 24,
            color: "#5D5FEF",
          }}
        >
          Konfirmasi Email Berhasil
        </Typography>
        <Typography
          sx={{
            fontFamily: "poppins",
            fontStyle: "normal",
            lineHeight: "24px",
            fontSize: 16,
            color: "#4F4F4F",

            mb: 3,
          }}
        >
          Silahkan Login terlebih dahulu untuk masuk ke aplikasi
        </Typography>
        <RouterLink to="/login" style={{ textDecoration: "none" }}>
          <Button
            variant="contained"
            sx={{ backgroundColor: "#5D5FEF", mb: 3, p: 2 }}
            size="medium"
          >
            <Typography
              sx={{
                fontFamily: "poppins",
                fontSize: 15,
                textTransform: "none",
              }}
            >
              Masuk Sekarang
            </Typography>
          </Button>
        </RouterLink>
      </Container>
    </>
  );
}

export default EmailConfirmSuccess;
