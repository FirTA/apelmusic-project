import {
  Box,
  Button,
  Card,
  CardActions,
  CardContent,
  CardMedia,
  Grid,
  Switch,
  Typography,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogContentText,
  DialogActions,
  TextField,
  IconButton,
} from "@mui/material";
import SettingsIcon from "@mui/icons-material/Settings";
import React, { useState, useEffect } from "react";
import Footer from "../../components/Footer";
import SetContextHeader from "../../components/SetContextHeader";
import userServices from "../../services/userServices";

export default function User() {
  const [users, setUsers] = useState([]);
  const [open, setOpen] = useState(false);
  const [formData, setFormData] = useState({
    nama_user: "",
    email: "",
    password: "",
  });
  const [idUser, setIdUser] = useState(0);
  const [isEdit, setIsEdit] = useState(false);

  const getUser = async () => {
    try {
      const response = await userServices.getAdmin();
      setUsers(response.data);
    } catch (err) {
      console.error("Error fetching admin users:", err);
    }
  };

  const saveToDb = async () => {
    try {
      await userServices.insertAdmin(formData);
      getUser();
      setOpen(false);
    } catch (error) {
      console.error("Error saving admin user:", error);
    }
  };

  const updateToDb = async () => {
    try {
      await userServices.updateAdmin(idUser, formData);
      getUser();
      setOpen(false);
    } catch (error) {
      console.error("Error updating admin user:", error);
    }
  };

  useEffect(() => {
    getUser();
  }, []);

  const handleSwitch = async (id_user, status) => {
    try {
      await userServices.changeStatusAdmin(id_user, !status);
      getUser();
    } catch (error) {
      console.error("Error changing admin status:", error);
    }
  };

  const label = { inputProps: { "aria-label": "Switch demo" } };

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  function handleChange(e) {
    let data = { ...formData };
    data[e.target.name] = e.target.value;
    setFormData(data);
  }

  function handleSetting(id_user) {
    // console.log(id_payment_method);
    setOpen(true);
    setIsEdit(true);

    let user = users.filter((user) => user.id_user === id_user);

    console.log(user);

    let data = { ...formData };
    data["nama_user"] = user[0].nama_user;
    data["email"] = user[0].email;
    setFormData(data);
    setIdUser(user[0].id_user);
  }

  return (
    <>
      <SetContextHeader />
      <Box align="center" sx={{ mb: 5, p: 2 }}>
        <Grid container spacing={4} maxWidth="md" sx={{ mt: 3 }}>
          <Grid
            item
            xs={6}
            sm={6}
            md={6}
            sx={{
              display: "flex",
              justifyContent: "flex-start",
            }}
          >
            <Typography variant="h5">List User</Typography>
          </Grid>
          <Grid
            item
            xs={6}
            sm={6}
            md={6}
            sx={{
              display: "flex",
              justifyContent: "flex-end",
            }}
          >
            <Button
              variant="contained"
              onClick={handleClickOpen}
              size="small"
              sx={{ textTransform: "none" }}
            >
              <Typography sx={{ fontSize: 12 }}>Tambah User</Typography>
            </Button>
          </Grid>
          {users &&
            users.map((user) => (
              <Grid item key={user.id_user} xs={12} sm={6} md={4}>
                <Card
                  sx={{
                    maxWidth: 345,
                    boxShadow:
                      "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)",
                  }}
                >
                  <CardMedia
                    sx={{ height: 140 }}
                    image="https://images.pexels.com/photos/9180717/pexels-photo-9180717.jpeg?auto=compress&cs=tinysrgb&w=400"
                    title="Admin"
                  />
                  <CardContent>
                    <Typography gutterBottom variant="h5">
                      {user.nama_user}
                    </Typography>
                    <Typography variant="body2" color="text.secondary">
                      {user.email}
                    </Typography>
                  </CardContent>
                  <CardActions
                    sx={{
                      display: "flex",
                      justifyContent: "flex-end",
                    }}
                  >
                    {user.status ? (
                      <Switch
                        {...label}
                        defaultChecked
                        onChange={() => handleSwitch(user.id_user, user.status)}
                      />
                    ) : (
                      <Switch
                        {...label}
                        onChange={() => handleSwitch(user.id_user, user.status)}
                      />
                    )}
                    <IconButton
                      aria-label="delete"
                      color="primary"
                      onClick={() => handleSetting(user.id_user)}
                    >
                      <SettingsIcon />
                    </IconButton>
                  </CardActions>
                </Card>
              </Grid>
            ))}
        </Grid>
      </Box>

      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>Tambah User</DialogTitle>
        <DialogContent>
          <DialogContentText sx={{ mb: 3 }}>
            Silakan isi form untuk menambahkan user baru
          </DialogContentText>
          <TextField
            id="nama_user"
            name="nama_user"
            label="Nama User"
            variant="outlined"
            fullWidth
            type="text"
            value={formData.nama_user}
            onChange={handleChange}
            sx={{ mb: 3 }}
            focused
          />
          <TextField
            id="email"
            name="email"
            label="Email"
            variant="outlined"
            fullWidth
            type="text"
            value={formData.email}
            onChange={handleChange}
            sx={{ mb: 3 }}
          />
          <TextField
            id="password"
            name="password"
            label="Password"
            type="password"
            fullWidth
            value={formData.password}
            onChange={handleChange}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>Cancel</Button>
          {isEdit ? (
            <Button onClick={updateToDb} variant="contained">
              Edit
            </Button>
          ) : (
            <Button onClick={saveToDb} variant="contained">
              Tambah
            </Button>
          )}
        </DialogActions>
      </Dialog>

      <Footer />
    </>
  );
}
