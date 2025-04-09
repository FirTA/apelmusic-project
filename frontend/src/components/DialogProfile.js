import {
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Typography,
} from "@mui/material";
import React from "react";
import AccountCircleIcon from "@mui/icons-material/AccountCircle";
import EmailIcon from "@mui/icons-material/Email";
import Dialog from "@mui/material/Dialog";
import DialogActions from "@mui/material/DialogActions";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import DialogTitle from "@mui/material/DialogTitle";
import Slide from "@mui/material/Slide";
import useAuth from "../hooks/useAuth";

const Transition = React.forwardRef(function Transition(props, ref) {
  return <Slide direction="up" ref={ref} {...props} />;
});

export default function DialogProfile({ open, onClose }) {
  const namaUser = localStorage.getItem("nama_user");
  const email = localStorage.getItem("email");

  const { auth } = useAuth();

  return (
    <>
      <Dialog
        open={open}
        TransitionComponent={Transition}
        keepMounted
        onClose={onClose}
        aria-describedby="alert-dialog-slide-description"
      >
        <DialogTitle>{"Profile"}</DialogTitle>
        <DialogContent>
          <ListItemButton>
            <ListItemIcon>
              <AccountCircleIcon />
            </ListItemIcon>
            <ListItemText primary={namaUser} />
            {/* <ListItemText primary={auth ? auth.nama_user : ""} /> */}
          </ListItemButton>
          <ListItemButton>
            <ListItemIcon>
              <EmailIcon />
            </ListItemIcon>
            <ListItemText primary={email} />
            {/* <ListItemText primary={auth ? auth.email : ""} /> */}
          </ListItemButton>
        </DialogContent>
      </Dialog>
    </>
  );
}
