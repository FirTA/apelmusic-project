import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import {
  Container,
  Divider,
  Checkbox,
  List,
  ListItem,
  Typography,
  FormControlLabel,
  FormLabel,
  IconButton,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Box,
  Grid,
  Button,
} from "@mui/material";
import { APIRequest } from "../api/post";
import SetContextHeader from "../components/SetContextHeader";
import { Stack } from "@mui/system";
import DeleteForever from "@mui/icons-material/DeleteForever";
import DialogPayment from "../components/DialogPayment";
import pic from "../assets/email_success.png";
import Backdrop from "@mui/material/Backdrop";
import CircularProgress from "@mui/material/CircularProgress";

// Checkout page
function CheckoutPage() {
  const [backdrop, setBackdrop] = useState(true);
  const [open, setOpen] = React.useState(false);
  const [checked, setChecked] = React.useState([]);
  const [selectAll, setSelectAll] = React.useState(false);
  const [harga, setHarga] = React.useState([]);
  const [cartUser, setCartUser] = useState([]);
  const [idDeleted, setIdDeleted] = useState(0);
  const id_user = localStorage.getItem("id_user") ?? "0";
  const [totalHarga, setTotalHarga] = useState(0);
  const [idPayment, setIdPayment] = useState(0);
  const navigate = useNavigate();

  function tglInvoice() {
    const date = new Date();
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    return `${year}-${month}-${day}`;
  }

  const handleCloseDialog = () => {
    setOpen(false);
  };

  const handlePaymentDialog = () => {
    setOpen(!open);
  };

  const numberToRupiah = (number) => {
    if (number != "") {
      return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    } else {
      return 0;
    }
  };

  const handleToggle = (value) => () => {
    const currentIndex = checked.indexOf(value);
    const newChecked = [...checked];
    const newHarga = [...harga];

    if (currentIndex === -1) {
      newChecked.push(value);

      let carts = cartUser.filter((cart) => cart.id_course_user == value);
      setTotalHarga(totalHarga + carts[0].harga);

      newHarga.push(carts[0].harga);

      // update database
      handleCheck(value, false);
    } else {
      newChecked.splice(currentIndex, 1);
      newHarga.splice(currentIndex, 1);

      let carts = cartUser.filter((cart) => cart.id_course_user == value);
      setTotalHarga(totalHarga - carts[0].harga);

      // update database
      handleCheck(value, true);
    }

    setChecked(newChecked);
    setHarga(newHarga);

    if (newHarga.length === cartUser.length) {
      setSelectAll(true);
    } else {
      setSelectAll(false);
    }
  };

  const handleCheck = async (id_course_user, check) => {
    const data = {
      check: !check,
    };

    try {
      let response = await APIRequest.put(
        "/course/ChangeCheckedCourseUser?id_course_user=" + id_course_user,
        data
      );

      // console.log(response);
    } catch (error) {
      console.log(error);
    }
  };

  // useEffect(() => {
  //   console.log(totalHarga);
  //   console.log(checked);
  //   console.log(cartUser);
  // }, [totalHarga]);

  const getCartUser = async () => {
    try {
      const response = await APIRequest.get(
        "/course/getCartUser?id_user=" + id_user
      );
      let carts = response.data;

      setTotalHarga(0);
      const newChecked = [];
      const newHarga = [];
      carts.map((cart) => {
        if (cart.check) {
          newChecked.push(cart.id_course_user);
          newHarga.push(cart.harga);
          setTotalHarga((prevent) => prevent + cart.harga);
        }
      });
      setChecked(newChecked);
      setHarga(newHarga);

      setCartUser(response.data);

      if (newChecked.length === carts.length) {
        setSelectAll(true);
      } else {
        setSelectAll(false);
      }

      setBackdrop(false);
    } catch (err) {
      if (err.response) {
        console.log(err.response.data);
        console.log(err.response.status);
        console.log(err.response.headers);
      } else {
        console.log(`Error : ${err.message}`);
      }
    }
  };

  const handleDelete = async (id_course_user) => {
    try {
      const response = APIRequest.delete(
        "/course/deleteCourseUser?id_course_user=" + id_course_user
      );

      setIdDeleted(id_course_user);
    } catch (err) {
      if (err.response) {
        console.log(err.response.data);
        console.log(err.response.status);
        console.log(err.response.headers);
      } else {
        console.log(`Error : ${err.message}`);
      }
    }
  };

  useEffect(() => {
    getCartUser();
  }, [idDeleted]);

  // useEffect(() => {
  //   console.log(idPayment);
  // }, [idPayment]);

  const saveToDb = async () => {
    const detailInvoice = checked.map((id, index) => ({
      fk_id_course_user: id,
      harga: harga[index],
    }));

    let data = {
      fk_id_user: localStorage.getItem("id_user"),
      fk_id_payment_method: idPayment,
      tgl_invoice: tglInvoice(),
      detailInvoice: detailInvoice,
    };

    try {
      let response = await APIRequest.post("/invoice/addinvoice", data);

      // console.log(response);
      // console.log(data);
      navigate("/successpurchase/" + response.data);
    } catch (error) {
      console.log(error);
    }
  };

  const handleSelectAll = () => {
    // console.log("select all");
    setSelectAll((prevent) => prevent);

    cartUser.map((cart) => {
      handleCheck(cart.id_course_user, selectAll);
    });

    getCartUser();
  };

  return (
    <>
      {backdrop === false ? (
        <>
          <SetContextHeader />
          <Container maxWidth="lg" sx={{ mb: 20 }}>
            {cartUser.length != 0 ? (
              <List sx={{ width: "100%", bgcolor: "background.paper" }}>
                <ListItem disablePadding>
                  <ListItemButton
                    role={undefined}
                    onClick={handleSelectAll}
                    dense
                  >
                    <ListItemIcon>
                      <Checkbox
                        edge="start"
                        checked={selectAll}
                        tabIndex={-1}
                        disableRipple
                        inputProps={{ "aria-labelledby": "select-all" }}
                      />
                    </ListItemIcon>
                    <ListItemText id={"select-all"} sx={{ flexGrow: 1 }}>
                      <Typography
                        sx={{
                          fontSize: "16px",
                          fontFamily: "Poppins",
                        }}
                      >
                        Pilih Semua
                      </Typography>
                    </ListItemText>
                  </ListItemButton>
                </ListItem>
                <Divider />
                {cartUser.map((cart) => {
                  const labelId = `checkbox-list-label-${cart.id_course_user}`;

                  return (
                    <>
                      <ListItem key={cart.id_course_user} disablePadding>
                        <ListItemButton
                          role={undefined}
                          onClick={handleToggle(cart.id_course_user)}
                          dense
                        >
                          <ListItemIcon>
                            <Checkbox
                              edge="start"
                              checked={
                                checked.indexOf(cart.id_course_user) !== -1
                              }
                              tabIndex={-1}
                              disableRipple
                              inputProps={{ "aria-labelledby": labelId }}
                            />
                          </ListItemIcon>
                          <ListItemText id={labelId} sx={{ flexGrow: 1 }}>
                            <Box>
                              <Stack direction="row" spacing={2}>
                                <>
                                  <Box
                                    sx={{
                                      display: {
                                        xs: "none",
                                        sm: "none",
                                        md: "block",
                                      },
                                    }}
                                  >
                                    <img
                                      src={cart.image_course}
                                      srcSet={cart.image_course}
                                      loading="lazy"
                                      height="133px"
                                      width="200px"
                                      sx={{ borderRadius: "20px" }}
                                    />
                                  </Box>
                                </>
                                <Box>
                                  <Typography
                                    sx={{
                                      fontSize: "16px",
                                      color: "#828282",
                                      fontFamily: "Poppins",
                                      fontWeight: "400",
                                      mb: 1,
                                      mt: 1,
                                    }}
                                  >
                                    {cart.nama_category}
                                  </Typography>
                                  <Typography
                                    sx={{
                                      fontSize: "20px",
                                      color: "#333333",
                                      fontFamily: "Poppins",
                                      fontWeight: "600",
                                      mb: 1,
                                    }}
                                  >
                                    {cart.nama_course}
                                  </Typography>
                                  <Typography
                                    sx={{
                                      fontSize: "16px",
                                      color: "#828282",
                                      fontFamily: "Poppins",
                                      fontWeight: "400",
                                      mb: 1,
                                      mt: 1,
                                    }}
                                  >
                                    Jadwal : {cart.waktu}
                                  </Typography>
                                  <Typography
                                    sx={{
                                      fontSize: "19px",
                                      color: "#5D5FEF",
                                      fontFamily: "Poppins",
                                    }}
                                  >
                                    IDR {numberToRupiah(cart.harga)}
                                  </Typography>
                                </Box>
                              </Stack>
                            </Box>
                          </ListItemText>
                        </ListItemButton>
                        <Button
                          onClick={() => handleDelete(cart.id_course_user)}
                        >
                          <IconButton edge="end" aria-label="comments">
                            <DeleteForever color="error" />{" "}
                            <Box
                              component="span"
                              sx={{
                                fontSize: "16px",
                                display: {
                                  xs: "none",
                                  sm: "none",
                                  md: "block",
                                },
                              }}
                            >
                              Delete
                            </Box>
                          </IconButton>
                        </Button>
                      </ListItem>
                      <Divider />
                    </>
                  );
                })}
              </List>
            ) : (
              <>
                <Box
                  sx={{
                    display: "flex",
                    justifyContent: "center",
                    flexDirection: "column",
                    alignItems: "center",
                  }}
                >
                  <img
                    src="https://img.freepik.com/free-vector/flat-shrug-illustration_23-2149408029.jpg?size=338&ext=jpg&ga=GA1.1.24438982.1676118421&semt=ais"
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
                    Cart Kosong
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
                    Silahkan memilih course terlebih dahulu
                  </Typography>
                </Box>
              </>
            )}
          </Container>

          {/* komponen total checkout and tombol checkout */}
          {cartUser.length != 0 && (
            <Box
              sx={{
                position: "fixed",
                bottom: "0",
                left: "0",
                right: "0",
                width: "100%",
                padding: "1rem 0",
                backgroundColor: "white",
                borderTop: "1px solid rgba(0, 0, 0, 0.12)",
              }}
            >
              <Container>
                <Stack direction="row" spacing={{ xs: 1, sm: 2, md: 4 }}>
                  <Box
                    sx={{
                      flexGrow: 1,
                      display: { xs: "none", sm: "block", md: "block" },
                    }}
                  >
                    <Typography
                      variant="span"
                      component="span"
                      sx={{
                        fontSize: "18px",
                        fontFamily: "Poppins",
                      }}
                    >
                      Total Biaya{" "}
                      <Box
                        component="span"
                        variant="span"
                        sx={{
                          fontSize: "24px",
                          color: "#5D5FEF",
                          ml: 2,
                        }}
                      >
                        IDR {numberToRupiah(totalHarga)}
                      </Box>
                    </Typography>
                  </Box>
                  <Box
                    sx={{
                      flexGrow: 1,
                      display: { xs: "block", sm: "none", md: "none" },
                    }}
                  >
                    <Typography
                      variant="span"
                      component="span"
                      sx={{
                        fontSize: "18px",
                        fontFamily: "Poppins",
                      }}
                    >
                      Total Biaya
                    </Typography>
                    <Typography
                      sx={{
                        fontSize: "24px",
                        color: "#5D5FEF",
                      }}
                    >
                      IDR {numberToRupiah(totalHarga)}
                    </Typography>
                  </Box>
                  <Box>
                    <Button
                      variant="contained"
                      disabled={checked.length === 0}
                      disableElevation
                      sx={{ textTransform: "none" }}
                      onClick={handlePaymentDialog}
                    >
                      Bayar Sekarang
                    </Button>
                  </Box>
                </Stack>
              </Container>
            </Box>
          )}
          <DialogPayment
            open={open}
            onClose={handleCloseDialog}
            setIdPayment={setIdPayment}
            saveToDb={saveToDb}
          />
        </>
      ) : (
        <Backdrop
          sx={{ color: "#fff", zIndex: (theme) => theme.zIndex.drawer + 1 }}
          open={backdrop}
        >
          <CircularProgress color="inherit" />
        </Backdrop>
      )}
    </>
  );
}

export default CheckoutPage;
