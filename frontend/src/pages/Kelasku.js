import {
  Box,
  Card,
  CardContent,
  CardMedia,
  Grid,
  IconButton,
  Typography,
} from "@mui/material";
import Divider from "@mui/material/Divider";
import SkipPreviousIcon from "@mui/icons-material/SkipPrevious";
import PlayArrowIcon from "@mui/icons-material/PlayArrow";
import SkipNextIcon from "@mui/icons-material/SkipNext";
import React, { useEffect, useState } from "react";
import SetContextHeader from "../components/SetContextHeader";
import { useTheme } from "@mui/material/styles";
import { Container, Stack } from "@mui/system";
import Footer from "../components/Footer";
import { APIRequest } from "../api/post";
import { Link as RouterLink } from "react-router-dom";
import Backdrop from "@mui/material/Backdrop";
import CircularProgress from "@mui/material/CircularProgress";

export default function Kelasku() {
  const [courseSaya, setCourseSaya] = useState([]);
  const [backdrop, setBackdrop] = useState(true);
  const theme = useTheme();
  const id_user = localStorage.getItem("id_user");

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

    return `${dayOfWeek}, ${day} ${month} ${year}`;
  }

  const getCourseUser = async () => {
    try {
      const response = await APIRequest.get(
        "/course/getcourseuser?id_user=" + id_user
      );
      setCourseSaya(response.data);
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

  useEffect(() => {
    getCourseUser();
  }, []);

  return (
    <>
      {backdrop === false ? (
        <>
          <SetContextHeader />
          <Container>
            <Box maxWidth="1098px" sx={{ mt: 5, mb: 5 }}>
              <Stack
                direction="column"
                divider={<Divider orientation="horizontal" flexItem />}
                spacing={2}
              >
                {courseSaya.length != 0 ? (
                  <>
                    {courseSaya.map((course, index) => (
                      <>
                        <Box
                          sx={{
                            display: { xs: "none", sm: "none", md: "block" },
                          }}
                        >
                          <Stack direction="row" spacing={2}>
                            <>
                              <RouterLink
                                to={"/course/" + course.fk_id_course}
                                style={{ textDecoration: "none" }}
                              >
                                <img
                                  src={course.image_course}
                                  srcSet={course.image_course}
                                  loading="lazy"
                                  height="133px"
                                  width="200px"
                                  sx={{ borderRadius: "20px" }}
                                />
                              </RouterLink>
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
                                {course.nama_category}
                              </Typography>
                              <RouterLink
                                to={"/course/" + course.fk_id_course}
                                style={{ textDecoration: "none" }}
                              >
                                <Typography
                                  sx={{
                                    fontSize: "20px",
                                    color: "#333333",
                                    fontFamily: "Poppins",
                                    fontWeight: "600",
                                    mb: 1,
                                  }}
                                >
                                  {course.nama_course}
                                </Typography>
                              </RouterLink>

                              <Typography
                                sx={{
                                  fontSize: "19px",
                                  color: "#5D5FEF",
                                  fontFamily: "Poppins",
                                }}
                              >
                                Jadwal : {dateIndonesia(course.waktu)}
                              </Typography>
                            </Box>
                          </Stack>
                        </Box>
                        <Box
                          sx={{
                            display: { xs: "block", sm: "block", md: "none" },
                          }}
                        >
                          <Card
                            sx={{
                              height: "100%",
                              display: "flex",
                              flexDirection: "column",
                              boxShadow: "none",
                              textAlign: "left",
                            }}
                          >
                            <RouterLink to={"/course/" + course.fk_id_course}>
                              <CardMedia
                                component="img"
                                sx={{ width: "100%" }}
                                image={course.image_course}
                                alt="random"
                              />
                            </RouterLink>
                            <CardContent sx={{ paddingLeft: "0px" }}>
                              <Typography
                                sx={{
                                  fontSize: "16px",
                                  color: "#828282",
                                  fontFamily: "Poppins",
                                  fontWeight: "400",
                                }}
                              >
                                {course.nama_category}
                              </Typography>

                              <RouterLink
                                to={"/course/" + course.fk_id_course}
                                style={{ textDecoration: "none" }}
                              >
                                <Typography
                                  sx={{
                                    fontSize: "18px",
                                    color: "#333333",
                                    fontFamily: "Poppins",
                                    fontWeight: "600",
                                    marginBottom: "27px",
                                  }}
                                >
                                  {course.nama_course}
                                </Typography>
                              </RouterLink>
                              <Typography
                                sx={{
                                  fontSize: "18px",
                                  color: "#5D5FEF",
                                  fontFamily: "Poppins",
                                }}
                              >
                                {dateIndonesia(course.waktu)}
                              </Typography>
                            </CardContent>
                          </Card>
                        </Box>
                      </>
                    ))}
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
                        Kelas Anda Kosong
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
              </Stack>
            </Box>
          </Container>
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
