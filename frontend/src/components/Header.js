import * as React from "react";
import { Link as RouterLink, Navigate, useNavigate } from "react-router-dom";
import { useContext, useEffect } from "react";

import Link from "@mui/material/Link";
import Typography from "@mui/material/Typography";
import Container from "@mui/material/Container";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";
import CardActions from "@mui/material/CardActions";
import Button from "@mui/material/Button";
import Stack from "@mui/material/Stack";
import AppBar from "@mui/material/AppBar";
import Toolbar from "@mui/material/Toolbar";
import IconButton from "@mui/material/IconButton";
import Menu from "@mui/material/Menu";
import MenuItem from "@mui/material/MenuItem";
import AppleIcon from "@mui/icons-material/Apple";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import PersonIcon from "@mui/icons-material/Person";
import LogoutIcon from "@mui/icons-material/Logout";
import MenuIcon from "@mui/icons-material/Menu";
import { HeaderContext } from "../context/HeaderContext";
import DialogProfile from "./DialogProfile";
import useAuth from "../hooks/useAuth";
import { axiosInstance } from "../api/post";

export default function Header() {
  const { header } = useContext(HeaderContext);
  const { auth, setAuth } = useAuth();
  const [anchorEl, setAnchorEl] = React.useState(null);
  const [open, setOpen] = React.useState(false);
  const navigate = useNavigate();

  const handleMenu = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  const handleCloseDialog = () => {
    setOpen(false);
  };

  const handleProfileDialog = () => {
    setOpen(!open);
    handleClose();
  };

  // useEffect(() => {
  //   console.log("header : ", header);
  // }, [header]);

  const handleOnLogout = () => {
    // console.log("logout bye bye....");
    localStorage.clear();
    if (auth) {
      setAuth(null);
      // localStorage.removeItem("token");
      // localStorage.removeItem("nama_user");
      // localStorage.removeItem("email");
      // localStorage.removeItem("role");
      axiosInstance.defaults.headers.common["Authorization"] = ``;
      navigate("/login");
    } else {
      navigate("/login");
    }
  };

  return (
    <>
      <AppBar
        position="sticky"
        sx={{ backgroundColor: header.backgroundColor }}
        elevation={0}
      >
        <Container maxWidth="lg">
          <Toolbar disableGutters>
            <RouterLink to="/" style={{ textDecoration: "none" }}>
              <Box sx={{ display: "flex" }}>
                <AppleIcon
                  sx={{ display: { xs: "flex", md: "flex" }, color: "#000000" }}
                />
                <Typography
                  variant="h6"
                  noWrap
                  sx={{
                    mr: 2,
                    display: { xs: "flex", md: "flex" },
                    fontFamily: "monospace",
                    fontWeight: 700,
                    color: "#000000",
                    textDecoration: "none",
                  }}
                >
                  Music
                </Typography>
              </Box>
            </RouterLink>

            <Box sx={{ flexGrow: 1, display: { xs: "flex", md: "flex" } }} />
            {header.variant === "guest" &&
              header.backgroundColor == "#F2C94C" && (
                <>
                  <Box
                    sx={{
                      flexGrow: 0,
                      display: { xs: "none", sm: "block", md: "block" },
                    }}
                  >
                    <Stack direction="row" spacing={2}>
                      <RouterLink
                        to="/register"
                        style={{ textDecoration: "none" }}
                      >
                        <Button
                          sx={{
                            textTransform: "none",
                            color: "#000000",
                            fontFamily: "poppins",
                            fontSize: 16,
                          }}
                        >
                          Daftar Sekarang
                        </Button>
                      </RouterLink>
                      <RouterLink
                        to="/login"
                        style={{ textDecoration: "none" }}
                      >
                        <Button
                          variant="contained"
                          sx={{
                            backgroundColor: "#5D5FEF",
                            textDecoration: "none",
                          }}
                        >
                          <Typography
                            sx={{
                              fontFamily: "poppins",
                              textTransform: "none",
                              fontSize: 16,
                            }}
                          >
                            Masuk
                          </Typography>
                        </Button>
                      </RouterLink>
                    </Stack>
                  </Box>

                  <Box
                    sx={{ display: { xs: "block", sm: "none", md: "none" } }}
                  >
                    <IconButton
                      size="large"
                      aria-label="account of current user"
                      aria-controls="menu-appbar"
                      aria-haspopup="true"
                      onClick={handleMenu}
                      color="inherit"
                    >
                      <MenuIcon sx={{ color: "black" }} />
                    </IconButton>
                    <Menu
                      id="menu-appbar"
                      anchorEl={anchorEl}
                      anchorOrigin={{
                        vertical: "top",
                        horizontal: "right",
                      }}
                      keepMounted
                      transformOrigin={{
                        vertical: "top",
                        horizontal: "right",
                      }}
                      open={Boolean(anchorEl)}
                      onClose={handleClose}
                    >
                      <RouterLink
                        to="/register"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <MenuItem onClick={handleClose}>
                          Daftar Sekarang
                        </MenuItem>
                      </RouterLink>
                      <RouterLink
                        to="/login"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <MenuItem onClick={handleClose}>Masuk</MenuItem>
                      </RouterLink>
                    </Menu>
                  </Box>
                </>
              )}

            {header.variant === "peserta" &&
              header.backgroundColor == "#F2C94C" && (
                <>
                  {/* tampil ketika layar md  */}
                  <Box
                    sx={{
                      flexGrow: 0,
                      display: { xs: "none", sm: "none", md: "block" },
                    }}
                  >
                    <Stack direction="row" spacing={2}>
                      <RouterLink
                        to="/checkout"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <Button
                          sx={{
                            textTransform: "none",
                            color: "#000000",
                            fontFamily: "poppins",
                          }}
                        >
                          <ShoppingCartIcon />
                        </Button>
                      </RouterLink>
                      <RouterLink
                        to="/kelasku"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <Button
                          sx={{
                            textTransform: "none",
                            color: "#000000",
                            fontFamily: "poppins",
                          }}
                        >
                          Kelasku
                        </Button>
                      </RouterLink>
                      <RouterLink
                        to="/invoiceuser"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <Button
                          sx={{
                            textTransform: "none",
                            color: "#000000",
                            fontFamily: "poppins",
                          }}
                        >
                          Pembelian
                        </Button>
                      </RouterLink>
                      <Typography variant="h6" sx={{ color: "black" }}>
                        |
                      </Typography>
                      <Button
                        sx={{
                          textTransform: "none",
                          color: "#000000",
                          fontFamily: "poppins",
                        }}
                        onClick={handleProfileDialog}
                      >
                        <PersonIcon />
                      </Button>
                      <Button
                        sx={{
                          textTransform: "none",
                          color: "#000000",
                          fontFamily: "poppins",
                        }}
                        onClick={handleOnLogout}
                      >
                        <LogoutIcon />
                      </Button>
                    </Stack>
                  </Box>

                  {/* tampil ketika layar xs dan sm  */}
                  <Box
                    sx={{ display: { xs: "block", sm: "block", md: "none" } }}
                  >
                    <IconButton
                      size="large"
                      aria-label="account of current user"
                      aria-controls="menu-appbar"
                      aria-haspopup="true"
                      onClick={handleMenu}
                      color="inherit"
                    >
                      <MenuIcon sx={{ color: "black" }} />
                    </IconButton>
                    <Menu
                      id="menu-appbar"
                      anchorEl={anchorEl}
                      anchorOrigin={{
                        vertical: "top",
                        horizontal: "right",
                      }}
                      keepMounted
                      transformOrigin={{
                        vertical: "top",
                        horizontal: "right",
                      }}
                      open={Boolean(anchorEl)}
                      onClose={handleClose}
                    >
                      <RouterLink
                        to="/checkout"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <MenuItem onClick={handleClose}>Cart</MenuItem>
                      </RouterLink>
                      <RouterLink
                        to="/kelasku"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <MenuItem onClick={handleClose}>Kelasku</MenuItem>
                      </RouterLink>
                      <RouterLink
                        to="/invoiceuser"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <MenuItem onClick={handleClose}>Pembelian</MenuItem>
                      </RouterLink>
                      <MenuItem onClick={handleProfileDialog}>Profile</MenuItem>
                      <RouterLink
                        to="/login"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <MenuItem
                          onClick={() => {
                            handleClose();
                            handleOnLogout();
                          }}
                        >
                          Logout
                        </MenuItem>
                      </RouterLink>
                    </Menu>
                  </Box>
                </>
              )}

            {header.variant === "admin" &&
              header.backgroundColor == "#F2C94C" && (
                <>
                  {/* tampil ketika layar md  */}
                  <Box
                    sx={{
                      flexGrow: 0,
                      display: { xs: "none", sm: "none", md: "block" },
                    }}
                  >
                    <Stack direction="row" spacing={2}>
                      <RouterLink to="/user" style={{ textDecoration: "none" }}>
                        <Button
                          sx={{
                            textTransform: "none",
                            color: "#000000",
                            fontFamily: "poppins",
                          }}
                        >
                          User
                        </Button>
                      </RouterLink>
                      <RouterLink
                        to="/payment"
                        style={{ textDecoration: "none" }}
                      >
                        <Button
                          sx={{
                            textTransform: "none",
                            color: "#000000",
                            fontFamily: "poppins",
                          }}
                        >
                          Payment
                        </Button>
                      </RouterLink>
                      <RouterLink
                        to="/invoice"
                        style={{ textDecoration: "none" }}
                      >
                        <Button
                          sx={{
                            textTransform: "none",
                            color: "#000000",
                            fontFamily: "poppins",
                          }}
                        >
                          Invoice
                        </Button>
                      </RouterLink>
                      <Typography variant="h6" sx={{ color: "black" }}>
                        |
                      </Typography>
                      <Button
                        sx={{
                          textTransform: "none",
                          color: "#000000",
                          fontFamily: "poppins",
                        }}
                        onClick={handleProfileDialog}
                      >
                        <PersonIcon />
                      </Button>
                      <Button
                        sx={{
                          textTransform: "none",
                          color: "#000000",
                          fontFamily: "poppins",
                        }}
                        onClick={handleOnLogout}
                      >
                        <LogoutIcon />
                      </Button>
                    </Stack>
                  </Box>

                  {/* tampil ketika layar xs dan sm  */}
                  <Box
                    sx={{ display: { xs: "block", sm: "block", md: "none" } }}
                  >
                    <IconButton
                      size="large"
                      aria-label="account of current user"
                      aria-controls="menu-appbar"
                      aria-haspopup="true"
                      onClick={handleMenu}
                      color="inherit"
                    >
                      <MenuIcon sx={{ color: "black" }} />
                    </IconButton>
                    <Menu
                      id="menu-appbar"
                      anchorEl={anchorEl}
                      anchorOrigin={{
                        vertical: "top",
                        horizontal: "right",
                      }}
                      keepMounted
                      transformOrigin={{
                        vertical: "top",
                        horizontal: "right",
                      }}
                      open={Boolean(anchorEl)}
                      onClose={handleClose}
                    >
                      <RouterLink
                        to="/user"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <MenuItem onClick={handleClose}>User</MenuItem>
                      </RouterLink>
                      <RouterLink
                        to="/payment"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <MenuItem onClick={handleClose}>Payment</MenuItem>
                      </RouterLink>
                      <RouterLink
                        to="/invoice"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <MenuItem onClick={handleClose}>Invoice</MenuItem>
                      </RouterLink>
                      <MenuItem onClick={handleProfileDialog}>Profile</MenuItem>
                      <RouterLink
                        to="/login"
                        style={{ textDecoration: "none", color: "#000000" }}
                      >
                        <MenuItem onClick={handleClose}>Logout</MenuItem>
                      </RouterLink>
                    </Menu>
                  </Box>
                </>
              )}
          </Toolbar>
        </Container>
      </AppBar>

      <DialogProfile open={open} onClose={handleCloseDialog} />
    </>
  );
}
