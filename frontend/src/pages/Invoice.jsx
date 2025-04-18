import axios from "axios";
import { APIRequest } from "../api/post";
import { useState, useRef, useEffect, useContext } from "react";

import { Link as RouterLink } from "react-router-dom";

import MainFeaturedPost from "../components/MainFeaturedPost";
import Header from "../components/Header";
import Footer from "../components/Footer";
import CardCourse from "../components/CardCourse";
import SetContextHeader from "../components/SetContextHeader";
import {
  styled,
  TableCell,
  Container,
  Button,
  Table,
  Box,
  Typography,
  TableContainer,
} from "@mui/material";
import Paper from "@mui/material/Paper";
import { tableCellClasses } from "@mui/material/TableCell";
import TableHead from "@mui/material/TableHead";
import TableBody from "@mui/material/TableBody";
import TableRow from "@mui/material/TableRow";
import Backdrop from "@mui/material/Backdrop";
import CircularProgress from "@mui/material/CircularProgress";
import invoiceServices from "../services/invoiceServices";

function createData(
  no,
  nomorInvoice,
  tanggalBeli,
  jumlahKursus,
  totalHarga,
  action
) {
  return { no, nomorInvoice, tanggalBeli, jumlahKursus, totalHarga, action };
}

const rows = [
  createData(1, "APM00003", "12 Juni 2022", 2, "IDR 11.500.000", "Rincian"),
  createData(2, "APM0000454", "12 Juni 2025", 5, "IDR 30.500.000", "Rincian"),
  createData(
    3,
    "APM000066",
    "12 Desember 2022",
    23,
    "IDR 70.500.000",
    "Rincian"
  ),
];

const StyledTableCell = styled(TableCell)(({ theme }) => ({
  [`&.${tableCellClasses.head}`]: {
    backgroundColor: "#F2C94C",
    color: "#4F4F4F",
  },
  [`&.${tableCellClasses.body}`]: {
    fontSize: 14,
  },
  fontFamily: "poppins",
}));

const StyledTableRow = styled(TableRow)(({ theme }) => ({
  "&:nth-of-type(even)": {
    backgroundColor: "#F2C94C33",
  },
  // hide last border
  //   "&:last-child td, &:last-child th": {
  //     border: 0,
  //   },
}));

function Invoice() {
  const id_user = localStorage.getItem("id_user") ?? "0";
  const role = localStorage.getItem("role");
  const [backdrop, setBackdrop] = useState(true);
  const [invoice, setInvoice] = useState([]);

  const nomorInvoice = (no_invoice) => {
    if (no_invoice < 10) {
      return "APM0000" + no_invoice;
    } else if (no_invoice >= 10 && no_invoice < 100) {
      return "APM000" + no_invoice;
    } else if (no_invoice >= 100 && no_invoice < 1000) {
      return "APM00" + no_invoice;
    } else if (no_invoice >= 1000 && no_invoice < 10000) {
      return "APM0" + no_invoice;
    } else if (no_invoice >= 10000) {
      return "APM" + no_invoice;
    }
  };

  function dateIndonesia(date) {
    const newDate = new Date(date);

    const days = [
      "Minggu",
      "Senin",
      "Selasa",
      "Rabu",
      "Kamis",
      "Jumat",
      "Sabtu",
    ];
    const months = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember",
    ];

    const dayOfWeek = days[newDate.getUTCDay()];
    const month = months[newDate.getUTCMonth()];
    const day = newDate.getUTCDate();
    const year = newDate.getUTCFullYear();

    return `${day} ${month} ${year}`;
  }

  const numberToRupiah = (number) => {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  };

  const getInvoice = async () => {
    try {
      if (role === "admin") {
        const response = await invoiceServices.getInvoice();
        setInvoice(response.data);
        setBackdrop(false);
      } else {
        const response = await invoiceServices.getInvoice(id_user);
        setInvoice(response.data);
        setBackdrop(false);
      }
    } catch (err) {
      console.error("Error fetching invoices:", err);
    }
  };

  useEffect(() => {
    getInvoice();
  }, []);

  return (
    <>
      {backdrop === false ? (
        <>
          <SetContextHeader />
          <Container
            sx={
              {
                // minHeight: "55vh",
              }
            }
          >
            <Box>
              <Typography
                sx={{
                  fontFamily: "poppins",
                  fontSize: 15,
                  lineHeight: 4,
                  textAlign: "left",
                  color: "#5D5FEF",
                }}
              >
                <RouterLink
                  to="/home"
                  style={{ textDecoration: "none", color: "#828282" }}
                >
                  Beranda
                </RouterLink>
                {" > Invoice"}
              </Typography>
            </Box>
            {invoice.length != 0 ? (
              <>
                <Box>
                  <Typography
                    sx={{
                      fontFamily: "poppins",
                      fontSize: 20,
                      fontWeigth: 600,
                      lineHeight: 4,
                      textAlign: "left",
                      textTransform: "none",
                    }}
                  >
                    Menu Invoice
                  </Typography>
                </Box>
                <TableContainer component={Paper} sx={{ mb: 3 }}>
                  <Table sx={{ minWidth: 700 }} aria-label="customized table">
                    <TableHead>
                      <TableRow>
                        <StyledTableCell align="center">No</StyledTableCell>

                        <StyledTableCell align="center">
                          No. Invoice
                        </StyledTableCell>

                        <StyledTableCell align="center">
                          Tanggal Beli
                        </StyledTableCell>

                        <StyledTableCell align="center">
                          Jumlah Kursus
                        </StyledTableCell>

                        <StyledTableCell align="center">
                          Total Harga
                        </StyledTableCell>

                        <StyledTableCell align="center">Action</StyledTableCell>
                      </TableRow>
                    </TableHead>
                    <TableBody>
                      {invoice.map((row, index) => (
                        <StyledTableRow key={row.id_invoice}>
                          <StyledTableCell align="center">
                            {index + 1}
                          </StyledTableCell>
                          <StyledTableCell align="center">
                            {nomorInvoice(row.no_invoice)}
                          </StyledTableCell>
                          <StyledTableCell align="center">
                            {dateIndonesia(row.tgl_invoice)}
                          </StyledTableCell>
                          <StyledTableCell align="center">
                            {row.detailInvoice.length}
                          </StyledTableCell>
                          <StyledTableCell align="center">
                            IDR {numberToRupiah(row.total_harga)}
                          </StyledTableCell>
                          <StyledTableCell align="center">
                            <RouterLink
                              to={
                                role == "admin"
                                  ? "/invoicedetail/" + row.id_invoice
                                  : "/invoiceuserdetail/" + row.id_invoice
                              }
                              style={{ textDecoration: "none" }}
                            >
                              <Button
                                variant="contained"
                                size="medium"
                                sx={{ backgroundColor: "#5D5FEF" }}
                              >
                                <Typography
                                  sx={{
                                    fontFamily: "poppins",
                                    fontSize: 15,
                                    px: 2,
                                    textTransform: "none",
                                  }}
                                >
                                  Rincian
                                </Typography>
                              </Button>
                            </RouterLink>
                          </StyledTableCell>
                        </StyledTableRow>
                      ))}
                    </TableBody>
                  </Table>
                </TableContainer>
              </>
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
                    Invoice Kosong
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
                    Silahkan lakukan pembelian course terlebih dahulu
                  </Typography>
                </Box>
              </>
            )}
          </Container>
          <Footer bottom={0} />
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

export default Invoice;
