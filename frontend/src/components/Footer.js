import React, { useState, useEffect, useContext } from "react";

import Typography from "@mui/material/Typography";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";
import Stack from "@mui/material/Stack";
import Avatar from "@mui/material/Avatar";
import PhoneIcon from "@mui/icons-material/Phone";
import InstagramIcon from "@mui/icons-material/Instagram";
import YouTubeIcon from "@mui/icons-material/YouTube";
import TelegramIcon from "@mui/icons-material/Telegram";
import MailIcon from "@mui/icons-material/Mail";
import { Link as RouterLink } from "react-router-dom";
import { HeaderContext } from "../context/HeaderContext";
import categoryServices from "../services/categoryServices";

export default function Footer() {
  const { header } = useContext(HeaderContext);
  const [categories, setCategories] = useState([]);

  const getCategory = async () => {
    try {
      const response = await categoryServices.getCategory();
      // handle success
      setCategories(response.data);
    } catch (err) {
      console.error("Error fetching category:", err);
    }
  };

  useEffect(() => {
    getCategory();
  }, []);

  return (
    <Box
      sx={{
        backgroundColor: "#F2C94C",
        mt: "auto",
        p: 5,
      }}
      align="center"
    >
      {header.variant !== "admin" ? (
        <Grid container spacing={5} maxWidth="lg" align="left">
          <Grid item xs={12} md={4} sm={12}>
            <Typography
              sx={{
                fontFamily: "poppins",
                fontWeight: "600",
                fontSize: 16,
                color: "#000000",
                mb: 1,
              }}
            >
              Tentang
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
              quis quia. Excepturi,
            </Typography>
          </Grid>

          <Grid item xs={12} md={4} sm={12}>
            <Typography
              sx={{
                fontFamily: "poppins",
                fontWeight: "600",
                fontSize: 16,
                color: "#000000",
                mb: 1,
              }}
            >
              Kategori
            </Typography>
            <Grid container spacing={1}>
              {categories.map((category, index) => (
                <Grid item xs={6} key={category.id_category}>
                  <RouterLink
                    to={"/category/" + category.id_category}
                    style={{ textDecoration: "none" }}
                  >
                    <Typography
                      sx={{
                        fontFamily: "poppins",
                        fontWeight: "400",
                        fontSize: 14,
                        color: "#000000",
                      }}
                    >
                      <li>{category.nama_category}</li>
                    </Typography>
                  </RouterLink>
                </Grid>
              ))}
            </Grid>
          </Grid>
          <Grid item xs={12} md={4} sm={12}>
            <Typography
              sx={{
                fontFamily: "poppins",
                fontWeight: "600",
                fontSize: 16,
                color: "#000000",
                mb: 1,
              }}
            >
              Alamat
            </Typography>
            <Typography
              sx={{
                mb: 3,
                fontFamily: "poppins",
                fontWeight: "400",
                fontSize: 14,
                color: "#000000",
                textAlign: "justify",
              }}
            >
              Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quasi
              omnis voluptatem eaque voluptatibus nesciunt est sed ab doloremque
            </Typography>
            <Typography
              sx={{
                fontFamily: "poppins",
                fontWeight: "600",
                fontSize: 16,
                color: "#000000",
                mb: 1,
              }}
            >
              Kontak
            </Typography>
            <Stack direction="row" spacing={2}>
              <Avatar sx={{ backgroundColor: "#5D5FEF" }}>
                <PhoneIcon />
              </Avatar>
              <Avatar sx={{ backgroundColor: "#5D5FEF" }}>
                <InstagramIcon />
              </Avatar>
              <Avatar sx={{ backgroundColor: "#5D5FEF" }}>
                <YouTubeIcon />
              </Avatar>
              <Avatar sx={{ backgroundColor: "#5D5FEF" }}>
                <TelegramIcon />
              </Avatar>
              <Avatar sx={{ backgroundColor: "#5D5FEF" }}>
                <MailIcon />
              </Avatar>
            </Stack>
          </Grid>
        </Grid>
      ) : (
        <Grid container spacing={5} maxWidth="lg" align="left">
          <Grid item xs={12} md={6} sm={12}>
            <Typography
              sx={{
                fontFamily: "poppins",
                fontWeight: "600",
                fontSize: 16,
                color: "#000000",
                mb: 1,
              }}
            >
              Tentang
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
              quis quia. Excepturi,
            </Typography>
          </Grid>
          <Grid item xs={12} md={6} sm={12}>
            <Typography
              sx={{
                fontFamily: "poppins",
                fontWeight: "600",
                fontSize: 16,
                color: "#000000",
                mb: 1,
              }}
            >
              Alamat
            </Typography>
            <Typography
              sx={{
                mb: 3,
                fontFamily: "poppins",
                fontWeight: "400",
                fontSize: 14,
                color: "#000000",
                textAlign: "justify",
              }}
            >
              Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quasi
              omnis voluptatem eaque voluptatibus nesciunt est sed ab doloremque
            </Typography>
            <Typography
              sx={{
                fontFamily: "poppins",
                fontWeight: "600",
                fontSize: 16,
                color: "#000000",
                mb: 1,
              }}
            >
              Kontak
            </Typography>
            <Stack direction="row" spacing={2}>
              <Avatar sx={{ backgroundColor: "#5D5FEF" }}>
                <PhoneIcon />
              </Avatar>
              <Avatar sx={{ backgroundColor: "#5D5FEF" }}>
                <InstagramIcon />
              </Avatar>
              <Avatar sx={{ backgroundColor: "#5D5FEF" }}>
                <YouTubeIcon />
              </Avatar>
              <Avatar sx={{ backgroundColor: "#5D5FEF" }}>
                <TelegramIcon />
              </Avatar>
              <Avatar sx={{ backgroundColor: "#5D5FEF" }}>
                <MailIcon />
              </Avatar>
            </Stack>
          </Grid>
        </Grid>
      )}
    </Box>
  );
}
