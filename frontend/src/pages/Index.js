import React from "react";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";

import axios from "axios";
import { APIRequest, APIRequestWithHeaders } from "../api/post";
import { useState, useRef, useEffect, useContext } from "react";

import { Link as RouterLink } from "react-router-dom";

import MainFeaturedPost from "../components/MainFeaturedPost";
import Header from "../components/Header";
import Footer from "../components/Footer";
import CardCourse from "../components/CardCourse";
import SetContextHeader from "../components/SetContextHeader";
import useAuth from "../hooks/useAuth";
import Backdrop from "@mui/material/Backdrop";
import CircularProgress from "@mui/material/CircularProgress";

export default function Index() {
  const { auth } = useAuth();
  const [categories, setCategories] = useState([]);
  const [favoriteCourse, setFavoriteCourse] = useState([]);
  const [backdrop, setBackdrop] = useState(true);

  // useEffect(() => {
  //   console.log("===== Landing page =====");
  // }, []);

  // useEffect(() => {
  //   console.log("auth data : ", auth);
  // }, [auth]);

  useEffect(() => {
    getCategory();
    getFavoriteCourse();
    window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
  }, []);

  const getCategory = async () => {
    try {
      const response = await APIRequest.get(
        "/category/getcategory"
        // {
        //   headers: { Authorization: `Bearer ${localStorage.getItem("token")}` },
        // }
      );
      // console.log(response);
      setCategories(response.data);
    } catch (err) {
      console.log(err);
      if (err.response) {
        console.log(err.response.data);
        console.log(err.response.status);
        console.log(err.response.headers);
      } else {
        console.log(`Error : ${err.message}`);
      }
    }
  };

  const getFavoriteCourse = async () => {
    try {
      const response = await APIRequest.get(
        "/course/getcourse"
        // {
        //   headers: { Authorization: `Bearer ${localStorage.getItem("token")}` },
        // }
      );

      let favoriteCourses = response.data.filter(
        (course) => course.favorit === true
      );
      setFavoriteCourse(favoriteCourses);
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

  return (
    <>
      <SetContextHeader />
      {backdrop === false ? (
        <>
          <MainFeaturedPost />
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
              Explore Kelas Favorit
            </Typography>

            <Grid container spacing={4} maxWidth="1098px">
              {favoriteCourse.map((course) => (
                <Grid item key={course.id_course} xs={12} sm={6} md={4}>
                  <CardCourse course={course} />
                </Grid>
              ))}
            </Grid>
          </Box>
          <Box
            sx={{
              backgroundColor: "#F6F6FE",
              p: 5,
            }}
            align="center"
          >
            <Grid container maxWidth="1098px" align="center" spacing={4}>
              <Grid item xs={12} md={12} sm={12}>
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
                  Pilih kelas impian kamu
                </Typography>
              </Grid>
              {categories.map((category, index) => (
                <Grid key={category.id_category} item xs={6} sm={4} md={3}>
                  <Card
                    sx={{
                      height: "100%",
                      display: "flex",
                      flexDirection: "column",
                      boxShadow: "none",
                      maxWidth: 150,
                      backgroundColor: "inherit",
                    }}
                  >
                    <RouterLink to={"/category/" + category.id_category}>
                      <CardMedia
                        component="img"
                        sx={{
                          textAlign: "center",
                          // width: "100%",
                        }}
                        image={category.image_category}
                        alt="random"
                      />
                    </RouterLink>
                    <CardContent sx={{}} align="center">
                      <Typography
                        sx={{
                          fontSize: 16,
                          color: "#000000",
                          fontFamily: "Poppins",
                          fontWeight: "400",
                        }}
                      >
                        {category.nama_category}
                      </Typography>
                    </CardContent>
                  </Card>
                </Grid>
              ))}
            </Grid>
          </Box>
          <Box
            sx={{
              display: { xs: "none", sm: "none", md: "block" },
            }}
            align="center"
          >
            <Grid container spacing={2} maxWidth="1098px" sx={{ mt: 10 }}>
              <Grid item md={4} sm={4} sx={{ mt: -13 }}>
                <img
                  src="./static/images/benefit.png"
                  loading="lazy"
                  width="363px"
                  height="363px"
                />
              </Grid>
              <Grid item md={8} sm={8} sx={{ p: 5 }}>
                <Typography
                  sx={{
                    fontFamily: "poppins",
                    fontWeight: "600",
                    fontSize: 16,
                    color: "#5D5FEF",
                    mb: 1,
                    textAlign: "left",
                  }}
                >
                  Benefit Ikut Apel Course
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
                  Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                  Quasi omnis voluptatem eaque voluptatibus nesciunt est sed ab
                  doloremque incidunt. Ex, beatae. Optio quas incidunt ex
                  provident sint illo quis quia. Excepturi, eaque voluptatibus
                  nesciunt est sed ab doloremque incidunt. Ex, beatae. Optio
                  quas incidunt ex provident sint illo quis quia. Excepturi,
                  eaque voluptatibus nesciunt est sed ab doloremque incidunt.
                  Ex, beatae. Optio quas incidunt ex provident sint illo quis
                  quia. Excepturi,
                </Typography>
              </Grid>
            </Grid>
          </Box>
          <Box
            sx={{
              p: 5,
              display: { xs: "block", sm: "block", md: "none" },
            }}
          >
            <Typography
              sx={{
                fontFamily: "poppins",
                fontWeight: "600",
                fontSize: 16,
                color: "#5D5FEF",
                mb: 1,
                opacity: 1,
              }}
            >
              Benefit Ikut Apel Course
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
              Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quasi
              omnis voluptatem eaque voluptatibus nesciunt est sed ab doloremque
              incidunt. Ex, beatae. Optio quas incidunt ex provident sint illo
              quis quia. Excepturi, eaque voluptatibus nesciunt est sed ab
              doloremque incidunt. Ex, beatae. Optio quas incidunt ex provident
              sint illo quis quia. Excepturi, eaque voluptatibus nesciunt est
              sed ab doloremque incidunt. Ex, beatae. Optio quas incidunt ex
              provident sint illo quis quia. Excepturi,
            </Typography>
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
