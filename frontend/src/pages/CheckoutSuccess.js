import { Container, TextField, Typography, Button, Box } from "@mui/material";
import React from "react";
// import { NavLink, Link } from "react-router-dom";
// import Header from "../components/Header";
// import HeaderLogReg from "../components/HeaderLogReg";
import pic from "./email_success.png";
import { Link as RouterLink } from "react-router-dom";
import { HeaderContext } from "../context/HeaderContext";
import { useContext, useEffect } from "react";
import SetContextHeader from "../components/SetContextHeader";

function CheckoutSuccess() {
    const { updateHeader } = useContext(HeaderContext);
    const { header } = useContext(HeaderContext);

    useEffect(() => {
        updateHeader({
            variant: header.variant,
            backgroundColor: "#ffffff",
        });
    }, []);

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
                <Box sx={{ display: 'flex', justifyContent: 'space-between' }}>
                    <RouterLink
                        to="/"
                    >
                        <Button
                            variant="outlined"
                            sx={{ p: 2, textDecoration: 'none' }}
                            size="medium"
                        >
                            <Typography
                                sx={{
                                    fontFamily: "poppins",
                                    fontSize: 15,
                                    textTransform: "none",
                                }}
                            >
                                Ke Beranda
                            </Typography>
                        </Button>
                    </RouterLink>
                    <RouterLink
                        to="/invoices"
                        style={{ textDecoration: "none" }}
                    >
                        <Button
                            variant="contained"
                            sx={{ backgroundColor: "#5D5FEF", p: 2, marginLeft: '1.5rem' }}
                            size="medium"
                        >
                            <Typography
                                sx={{
                                    fontFamily: "poppins",
                                    fontSize: 15,
                                    textTransform: "none",
                                }}
                            >
                                Buka Invoice
                            </Typography>
                        </Button>
                    </RouterLink>
                </Box>
            </Container>
        </>
    );
}

export default CheckoutSuccess;
