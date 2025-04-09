import { Typography } from "@mui/material";
import React, { useState } from "react";
import { Navigate, Outlet, useLocation } from "react-router-dom";
import useAuth from "../hooks/useAuth";
import Backdrop from "@mui/material/Backdrop";
import CircularProgress from "@mui/material/CircularProgress";

function ProtectedRoutes() {
  let { auth, setAuth, loadAuth } = useAuth();
  let location = useLocation();
  const [backdrop, setBackdrop] = useState(true);

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
  if (!auth && !loadAuth) {
    return <Navigate to="/login" state={{ from: location }} />;
  }

  if (auth.role === "admin") {
    return <Navigate to="/user" state={{ from: location }} />;
  }

  return <Outlet />;
}

export default ProtectedRoutes;
