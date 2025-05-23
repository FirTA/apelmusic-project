import React from "react";
import Card from "@mui/material/Card";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";
import { useState, useEffect } from "react";
import Footer from "../components/Footer";
import CardCourse from "../components/CardCourse";
import { useParams, useNavigate } from "react-router-dom";
import Alert from "@mui/material/Alert";
import Select from "@mui/material/Select";
import MenuItem from "@mui/material/MenuItem";
import { Button, FormControl, Stack } from "@mui/material";
import SetContextHeader from "../components/SetContextHeader";
import CloseIcon from "@mui/icons-material/Close";
import IconButton from "@mui/material/IconButton";
import Collapse from "@mui/material/Collapse";
import Backdrop from "@mui/material/Backdrop";
import CircularProgress from "@mui/material/CircularProgress";
import courseServices from "../services/courseServices";

export default function CoursePage() {
  const navigate = useNavigate();
  const [backdrop, setBackdrop] = useState(true);
  const [open, setOpen] = React.useState(false);
  const [course, setCourse] = useState({
    id_course: "",
    fk_id_category: "",
    nama_course: "",
    deskripsi_course: "",
    harga: "",
    image_course: "",
    nama_category: "",
  });
  const [recommendedCourse, setRecommendedCourse] = useState([]);
  const [courseUser, setCourseUser] = useState([]);
  const params = useParams();
  const [jadwal, setJadwal] = useState("");
  const [today, setToday] = useState(new Date());
  const [dates, setDates] = useState([]);
  const [dateValue, setDateValue] = useState([]);
  const role = localStorage.getItem("role") ?? "guest";
  const [formData, setFormData] = useState({
    fk_id_user: localStorage.getItem("id_user") ?? "0",
    fk_id_course: "",
    waktu: jadwal,
    checked: "",
  });

  useEffect(() => {
    console.log("params: ", params.id);
  }, []);

  const numberToRupiah = (number) => {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  };

  function dateIndonesia(date) {
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

    const dayOfWeek = days[date.getUTCDay()];
    const month = months[date.getUTCMonth()];
    const day = date.getUTCDate();
    const year = date.getUTCFullYear();

    return `${dayOfWeek}, ${day} ${month} ${year}`;
  }

  function dateSystem(date) {
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    // const month = date.getUTCMonth() + 1;
    // const day = date.getUTCDate();
    const year = date.getUTCFullYear();

    return `${year}-${month}-${day}`;
  }

  function generateDates() {
    setDates([]);
    for (let i = 1; i < 8; i++) {
      const days = new Date(today.getTime() + i * 24 * 60 * 60 * 1000);
      setDates((dates) => [...dates, "" + dateIndonesia(days)]);
      setDateValue((dateValue) => [...dateValue, "" + dateSystem(days)]);
    }
  }

  const getCourseUser = async () => {
    try {
      const response = await courseServices.getCartUser(formData.fk_id_user);
      let courses = response.data.filter(
        (course) => course.fk_id_course === params.id
      );
      setCourseUser(courses);
    } catch (err) {
      console.error("Error fetching user's courses:", err);
    }
  };

  useEffect(() => {
    getCourse(params.id);
    getCourseUser();
    generateDates();
    setJadwal("");
  }, [params]);

  useEffect(() => {
    getRecommendedCourse();
    window.scrollTo({ top: 0, left: 0, behavior: "smooth" });

    let data = { ...formData };
    data["fk_id_course"] = course.id_course;
    data["waktu"] = "";
    setFormData(data);
  }, [course]);

  function handleJadwal(e) {
    let data = { ...formData };
    data["waktu"] = e.target.value;
    setFormData(data);

    setJadwal(e.target.value);
  }

  const getCourse = async (id) => {
    try {
      const response = await courseServices.getCourseById(id);
      setCourse(response.data[0]);
      setBackdrop(false);
    } catch (err) {
      console.error("Error fetching course:", err);
    }
  };

  const getRecommendedCourse = async () => {
    try {
      const recomendCourses = await courseServices.getRecommendedCourses(
        course.fk_id_category,
        course.id_course
      );
      setRecommendedCourse(recomendCourses);
    } catch (err) {
      console.error("Error fetching recommended courses:", err);
    }
  };

  const saveToDb = async (status) => {
    const data = {
      fk_id_user: formData.fk_id_user,
      fk_id_course: formData.fk_id_course,
      waktu: formData.waktu,
      check: status,
    };

    try {
      await courseServices.insertCourseUser(data);
      if (status) navigate("/checkout");
      else {
        setOpen(true);
        getCourseUser();
        setJadwal("");
      }
    } catch (error) {
      console.error("Error saving course:", error);
    }
  };

  return (
    <>
      <SetContextHeader />
      {backdrop === false ? (
        <>
          <Box align="center" sx={{ p: 5, pb: 0 }}>
            <Grid container maxWidth="1098px" spacing={3}>
              <Grid item xs={12} sm={12} md={4} sx={{ pl: 10 }}>
                <Card
                  sx={{
                    height: "100%",
                    display: "flex",
                    flexDirection: "column",
                    boxShadow: "none",
                    textAlign: "left",
                    p: 0,
                  }}
                >
                  <CardMedia
                    component="img"
                    sx={{ width: "100%", pl: 0 }}
                    image={course.image_course}
                    alt="random"
                  />
                </Card>
              </Grid>
              <Grid item xs={12} sm={12} md={8} align="left">
                <Typography
                  sx={{
                    fontSize: 16,
                    color: "#828282",
                    fontFamily: "Poppins",
                    fontWeight: "400",
                  }}
                >
                  {course.nama_category}
                </Typography>
                <Typography
                  sx={{
                    fontSize: 24,
                    color: "#333333",
                    fontFamily: "Poppins",
                    fontWeight: "600",
                  }}
                >
                  {course.nama_course}
                </Typography>

                <Typography
                  sx={{
                    fontSize: "18px",
                    color: "#5D5FEF",
                    fontFamily: "Poppins",
                    fontWeight: "600",
                  }}
                >
                  Rp {numberToRupiah(`${course.harga}`)}
                </Typography>

                <FormControl sx={{ mt: 3, minWidth: 250 }}>
                  <Select
                    value={jadwal}
                    onChange={handleJadwal}
                    displayEmpty
                    inputProps={{ "aria-label": "Without label" }}
                    size="small"
                  >
                    <MenuItem value="">Pilih Jadwal Kelas</MenuItem>

                    {dates.map((dates, index) => {
                      const dateValueInCourseUser = courseUser.some(
                        (course) => course.waktu === dateValue[index]
                      );

                      if (!dateValueInCourseUser) {
                        return (
                          <MenuItem
                            value={dateValue[index]}
                            key={dateValue[index]}
                          >
                            {dates}
                          </MenuItem>
                        );
                      }

                      return null; // Skip rendering this date
                    })}
                  </Select>
                </FormControl>
                {role !== "peserta" ? (
                  <Alert variant="filled" severity="error" sx={{ mt: 4 }}>
                    Anda harus login terlebih dahulu untuk membeli kelas ini!
                  </Alert>
                ) : (
                  <>
                    <Collapse in={open}>
                      <Alert
                        action={
                          <IconButton
                            aria-label="close"
                            color="inherit"
                            size="small"
                            onClick={() => {
                              setOpen(false);
                            }}
                          >
                            <CloseIcon fontSize="inherit" />
                          </IconButton>
                        }
                        sx={{ mt: 2 }}
                      >
                        Berhasil memasukkan course ke Cart
                      </Alert>
                    </Collapse>
                    <Stack direction="row" spacing={2} sx={{ mt: 4 }}>
                      <Button
                        variant="outlined"
                        disabled={jadwal === ""}
                        sx={{
                          textDecoration: "none",
                        }}
                        onClick={() => saveToDb(false)}
                      >
                        <Typography
                          sx={{
                            fontFamily: "poppins",
                            textTransform: "none",
                            fontSize: 16,
                          }}
                        >
                          Masukkan Keranjang
                        </Typography>
                      </Button>
                      <Button
                        variant="contained"
                        disabled={jadwal === ""}
                        sx={{
                          backgroundColor: "#5D5FEF",
                          textDecoration: "none",
                        }}
                        onClick={() => saveToDb(true)}
                      >
                        <Typography
                          sx={{
                            fontFamily: "poppins",
                            textTransform: "none",
                            fontSize: 16,
                          }}
                        >
                          Beli Sekarang
                        </Typography>
                      </Button>
                    </Stack>
                  </>
                )}
              </Grid>
            </Grid>
          </Box>
          <Box align="center" sx={{ p: 5 }}>
            <Grid maxWidth="1098px">
              <Grid item>
                <Typography
                  sx={{
                    fontFamily: "poppins",
                    fontWeight: "600",
                    fontSize: 16,
                    color: "#000000",
                    mb: 1,
                    textAlign: "left",
                  }}
                >
                  Deskripsi
                </Typography>
                <Typography
                  sx={{
                    fontFamily: "poppins",
                    fontWeight: "400",
                    fontSize: 14,
                    color: "#000000",
                    textAlign: "justify",
                  }}
                >
                  {course.deskripsi_course}
                </Typography>
              </Grid>
            </Grid>
          </Box>

          <hr style={{ borderColor: "#E0E0E0" }} />

          <Box sx={{ mb: 5, p: 5 }} align="center">
            {/* End hero unit */}
            <Typography
              sx={{
                textAlign: "center",
                mb: 5,
                fontFamily: "inter",
                fontWeight: "600",
                fontSize: "24px",
                color: "#5D5FEF",
              }}
            >
              Kelas lain yang mungkin kamu suka
            </Typography>

            <Grid container spacing={4} maxWidth="md">
              {recommendedCourse.map((course) => (
                <Grid item key={course.id_course} xs={12} sm={6} md={4}>
                  <CardCourse course={course} />
                </Grid>
              ))}
            </Grid>
          </Box>
          <Footer />
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
