import {
  Typography,
  Dialog,
  Alert,
  AlertTitle,
  Box,
  Button,
} from "@mui/material";
import React, { useEffect, useState } from "react";
import { Navigate, Outlet, useLocation } from "react-router-dom";
import useAuth from "../hooks/useAuth";
import Backdrop from "@mui/material/Backdrop";
import CircularProgress from "@mui/material/CircularProgress";

function NonLoggedRoutes() {
  let { auth, setAuth, loadAuth } = useAuth();
  const [backdrop, setBackdrop] = useState(true);
  const [open, setOpen] = useState(true);
  let location = useLocation();

  // useEffect(() => {
  //   console.log(auth);
  // }, [auth]);

  const handleClose = () => {
    setOpen(false);
  };

  if (loadAuth) {
    return (
      <>
        <Backdrop
          sx={{ color: "#fff", zIndex: (theme) => theme.zIndex.drawer + 1 }}
          open={backdrop}
        >
          <CircularProgress color="inherit" />
        </Backdrop>
      </>
    );
  }

  if (auth?.role) {
    return (
      <>
        <Navigate to="/home" state={{ from: location }} />
      </>
    );
  }

  return <Outlet />;
}

export default NonLoggedRoutes;
