import { Container, TextField, Typography, Button, Box } from "@mui/material";
import React from "react";
import Header from "../components/Header";
import HeaderLogReg from "../components/HeaderLogReg";
import pic from "../assets/email_success.png";
import { Link as RouterLink, useParams } from "react-router-dom";
import { HeaderContext } from "../context/HeaderContext";
import { useContext, useEffect } from "react";
import SetContextHeader from "../components/SetContextHeader";
import { APIRequest as Axios } from "../api/user";
import ArrowForwardIcon from "@mui/icons-material/ArrowForward";
import HomeIcon from "@mui/icons-material/Home";

function SuccessPurchase() {
  const { updateHeader } = useContext(HeaderContext);
  const { header } = useContext(HeaderContext);
  const role = localStorage.getItem("role");
  const params = useParams();

  useEffect(() => {
    updateHeader({
      variant: header.variant,
      backgroundColor: "#ffffff",
    });
  }, []);
  const { token } = useParams();

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
          Pembelian Berhasil
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
          Yey! Kamu telah berhasil membeli kursus di Apel Music
        </Typography>
        <Box sx={{ justifyContent: "center", display: "flex" }}>
          <Box sx={{ p: 2 }}>
            <RouterLink to="/home" style={{ textDecoration: "none" }}>
              <Button
                variant="outlined"
                sx={{
                  backgroundColor: "white",
                  mb: 3,
                  p: 2,
                  color: "#5D5FEF",
                  borderColor: "#5D5FEF",
                }}
                size="medium"
              >
                <HomeIcon fontSize="small" />
                <Typography
                  sx={{
                    fontFamily: "poppins",
                    fontSize: 15,
                    pl: 1,
                    textTransform: "none",
                  }}
                >
                  Ke Beranda
                </Typography>
              </Button>
            </RouterLink>
          </Box>

          <Box sx={{ p: 2 }}>
            <RouterLink
              to={
                role == "admin"
                  ? "/invoicedetail/" + params.id
                  : "/invoiceuserdetail/" + params.id
              }
              style={{ textDecoration: "none" }}
            >
              <Button
                variant="contained"
                sx={{ backgroundColor: "#5D5FEF", mb: 3, p: 2 }}
                size="medium"
              >
                <ArrowForwardIcon fontSize="small" />
                <Typography
                  sx={{
                    fontFamily: "poppins",
                    fontSize: 15,
                    pl: 1,
                    textTransform: "none",
                  }}
                >
                  Buka Invoice
                </Typography>
              </Button>
            </RouterLink>
          </Box>
        </Box>
      </Container>
    </>
  );
}

export default SuccessPurchase;
