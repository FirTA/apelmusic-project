import React, { useEffect, useState } from "react";
import { Navigate, Outlet, useLocation } from "react-router-dom";
import useAuth from "../hooks/useAuth";
import Backdrop from "@mui/material/Backdrop";
import CircularProgress from "@mui/material/CircularProgress";

function AdminRoutes() {
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
  if (!auth && !loadAuth) {
    return <Navigate to="/login" state={{ from: location }} />;
  }

  if (auth.role !== "admin") {
    return (
      <>
        {/* <Dialog
          open={open}
          // TransitionComponent={Transition}
          keepMounted
          onClose={handleClose}
          aria-describedby="alert-dialog-slide-description"
        >
          <Alert severity="error" sx={{ fontFamily: "poppins" }}>
            <AlertTitle>Gagal Akses Halaman</AlertTitle>
            Maaf hak anda tidak memenuhi untuk masuk halaman tersebut.
            <Box sx={{ display: "flex", justifyContent: "flex-end" }}>
              <Button color="inherit" size="small" onClick={handleClose}>
                ok
              </Button>
            </Box>
          </Alert>
        </Dialog> */}
        <Navigate to="/home" state={{ from: location }} />
      </>
    );
  }

  return <Outlet />;
}

export default AdminRoutes;
