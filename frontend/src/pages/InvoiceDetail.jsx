import { useState, useEffect, useCallback } from "react";
import { Link as RouterLink, useParams } from "react-router-dom";

import Footer from "../components/Footer";
import SetContextHeader from "../components/SetContextHeader";
import {
  styled,
  TableCell,
  Container,
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
import { Stack } from "@mui/system";
import invoiceServices from "../services/invoiceServices";

const StyledTableCell = styled(TableCell)(({ theme }) => ({
  [`&.${tableCellClasses.head}`]: {
    backgroundColor: "#F2C94C",
    color: "#4F4F4F",
  },
  [`&.${tableCellClasses.body}`]: {
    fontSize: 14,
  },
  fontFamily: "Poppins",
}));

const StyledTableRow = styled(TableRow)(({ theme }) => ({
  "&:nth-of-type(even)": {
    backgroundColor: "#F2C94C33",
  },
}));

function InvoiceDetail() {
  const [invoice, setInvoice] = useState({});
  const role = localStorage.getItem("role");
  const params = useParams();

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

  function dateIndonesia(date, hari = false) {
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

    if (hari) {
      return `${dayOfWeek}, ${day} ${month} ${year}`;
    } else {
      return `${day} ${month} ${year}`;
    }
  }

  function numberToRupiah(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  }

  const getDetailInvoice = useCallback(async () => {
    try {
      const response = await invoiceServices.getDetailInvoice(params.id);
      setInvoice(response.data[0]);
      // console.log(response.data[0]);
    } catch (err) {
      if (err.response) {
        console.log(err.response.data);
        console.log(err.response.status);
        console.log(err.response.headers);
      } else {
        console.log(`Error : ${err.message}`);
      }
    }
  }, [params.id]);

  useEffect(() => {
    getDetailInvoice();
  }, [getDetailInvoice]);
  useEffect(() => {
    console.log("Initial data when the component is called:", invoice);
  }, [invoice]);
  // useEffect(() => {
  //   console.log(invoice);
  // }, [invoice]);

  return (
    <>
      <SetContextHeader />
      <Container
        sx={{
          minHeight: "55vh",
        }}
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
              {"Beranda > "}
            </RouterLink>

            <RouterLink
              to={role === "admin" ? "/invoice" : "/invoiceuser"}
              style={{ textDecoration: "none", color: "#828282" }}
            >
              {"Invoice > "}
            </RouterLink>
            {"Rincian Invoice"}
          </Typography>
        </Box>
        <Box>
          <Typography
            sx={{
              fontFamily: "poppins",
              fontSize: 20,
              fontWeight: 600,
              lineHeight: 4,
              textAlign: "left",
              textTransform: "none",
            }}
          >
            Rincian Invoice
          </Typography>
        </Box>
        <Box sx={{ mb: 2 }}>
          <Typography sx={{ fontFamily: "Poppins", mb: 1 }}>
            No. Invoice: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            {nomorInvoice(invoice.no_invoice)}
          </Typography>

          <Stack
            direction={{ xs: "column", md: "row" }}
            spacing={{ xs: 1, sm: 2, md: 4 }}
          >
            <Box sx={{ flexGrow: 1 }}>
              <Typography sx={{ fontFamily: "Poppins" }}>
                Tanggal Beli: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                {dateIndonesia(invoice.tgl_invoice)}
              </Typography>
            </Box>
            <Box>
              <Typography
                sx={{
                  display: "flex",
                  justifyContent: { sx: "flex-start", md: "flex-end" },
                  alignItems: { sx: "flex-start", md: "flex-end" },
                  fontFamily: "Poppins",
                  fontWeight: 600,
                }}
              >
                Total Harga &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IDR{" "}
                {invoice.total_harga && numberToRupiah(invoice.total_harga)}
              </Typography>
            </Box>
          </Stack>
        </Box>
        <TableContainer component={Paper} sx={{ mb: 3 }}>
          <Table sx={{ minWidth: 700 }} aria-label="customized table">
            <TableHead>
              <TableRow>
                <StyledTableCell align="center">No</StyledTableCell>

                <StyledTableCell align="center">Nama Course</StyledTableCell>

                <StyledTableCell align="center">Kategori</StyledTableCell>

                <StyledTableCell align="center">Jadwal</StyledTableCell>

                <StyledTableCell align="center">Harga</StyledTableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {invoice.detailInvoice &&
                invoice.detailInvoice.map((row, index) => (
                  <StyledTableRow key={row.id_detail}>
                    <StyledTableCell align="center">
                      {index + 1}
                    </StyledTableCell>
                    <StyledTableCell align="center">
                      {row.nama_course}
                    </StyledTableCell>
                    <StyledTableCell align="center">
                      {row.nama_category}
                    </StyledTableCell>
                    <StyledTableCell align="center">
                      {dateIndonesia(row.waktu, true)}
                    </StyledTableCell>
                    <StyledTableCell align="center">
                      IDR {numberToRupiah(row.harga)}
                    </StyledTableCell>
                  </StyledTableRow>
                ))}
            </TableBody>
          </Table>
        </TableContainer>
      </Container>

      <Footer />
    </>
  );
}

export default InvoiceDetail;
