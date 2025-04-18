import React from "react";
import Typography from "@mui/material/Typography";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";

import { useState, useEffect } from "react";

import Footer from "../components/Footer";
import CardCourse from "../components/CardCourse";
import CoverCategory from "../components/CoverCategory";

import { useParams } from "react-router-dom";
import SetContextHeader from "../components/SetContextHeader";
import Backdrop from "@mui/material/Backdrop";
import CircularProgress from "@mui/material/CircularProgress";
import categoryServices from "../services/categoryServices";
import courseServices from "../services/courseServices";

export default function CategoryPage() {
  const [categories, setCategories] = useState({});
  const [backdrop, setBackdrop] = useState(true);
  const [favoriteCourse, setFavoriteCourse] = useState([]);
  const params = useParams();

  useEffect(() => {
    getCategory();
    getKelasTersedia();
    window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
  }, [params]);

  const getCategory = async () => {
    try {
      const response = await categoryServices.getCategory();
      // handle success
      let category = response.data.filter(
        (course) => course.id_category === params.id
      );

      setCategories(category[0]);
      setBackdrop(false);
    } catch (err) {
      console.error("Error fetching category:", err);
    }
  };

  const getKelasTersedia = async () => {
    try {
      const favoriteCourses = await courseServices.getFavoriteCourse();
      setFavoriteCourse(favoriteCourses);
    } catch (err) {
      console.error("Error fetching available courses:", err);
    }
  };
  return (
    <>
      <SetContextHeader />
      {backdrop === false ? (
        <>
          <CoverCategory cover_category={categories.cover_category} />
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
                  {categories.profesi_category} Class
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
                  {categories.deskripsi_category}
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
              Kelas yang tersedia
            </Typography>

            <Grid container spacing={4} maxWidth="1098px">
              {favoriteCourse.map((course) => (
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
