import * as React from "react";
import PropTypes from "prop-types";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import Grid from "@mui/material/Grid";
import Link from "@mui/material/Link";
import Box from "@mui/material/Box";
import Stack from "@mui/material/Stack";
import Button from "@mui/material/Button";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import { styled } from "@mui/material/styles";

function MainFeaturedPost() {
  return (
    <Paper
      sx={{
        position: "relative",
        backgroundColor: "grey.800",
        color: "#fff",
        mb: 5,
        pt: 5,
        pb: 5,
        pl: 5,
        pr: 5,
        backgroundSize: "cover",
        backgroundRepeat: "no-repeat",
        backgroundPosition: "center",
        backgroundImage: `url(/static/images/cover/cover.png)`,
      }}
      align="center"
    >
      <Typography
        align="center"
        sx={{
          color: "#FFFFFF",
          fontFamily: "poppins",
          fontWeight: "600",
          fontSize: 25,
          mb: 5,
        }}
      >
        Hi Musikers! Gabung yuk di Apel Music
      </Typography>
      <Typography
        align="center"
        sx={{
          color: "#FFFFFF",
          fontFamily: "poppins",
          fontWeight: "400",
          fontSize: 18,
        }}
      >
        Banyak kelas keren yang bisa menunjang bakat musik kamu
      </Typography>
      <Grid
        container
        spacing={4}
        sx={{ mt: 5, mb: 2 }}
        maxWidth="md"
        align="center"
      >
        <Grid item xs={12} sm={4} md={4}>
          <Card
            sx={{
              height: "100%",
              display: "flex",
              flexDirection: "column",
              justifyContent: "center",
              alignItems: "center",
              boxShadow: "none",
              backgroundColor: "#FFFFFF",
              borderRadius: "20px",
            }}
          >
            <CardContent>
              <Stack spacing={2}>
                <Typography
                  sx={{
                    fontSize: 40,
                    color: "#333333",
                    fontFamily: "Poppins",
                    fontWeight: "600",
                    color: "#5D5FEF",
                    textAlign: "center",
                  }}
                >
                  500+
                </Typography>
                <Typography
                  sx={{
                    color: "#333333;",
                    fontFamily: "Poppins",
                    fontWeight: "600",
                    textAlign: "center",
                    fontSize: 13,
                  }}
                >
                  Lebih dari sekedar kelas biasa yang bisa mengeluarkan bakat
                  kalian
                </Typography>
              </Stack>
            </CardContent>
          </Card>
        </Grid>
        <Grid item xs={12} sm={4} md={4}>
          <Card
            sx={{
              height: "100%",
              display: "flex",
              flexDirection: "column",
              justifyContent: "center",
              alignItems: "center",
              boxShadow: "none",
              backgroundColor: "#FFFFFF",
              borderRadius: "20px",
            }}
          >
            <CardContent sx={{ flexGrow: 1 }}>
              <Stack spacing={2}>
                <Typography
                  sx={{
                    fontSize: 40,
                    color: "#333333",
                    fontFamily: "Poppins",
                    fontWeight: "600",
                    color: "#5D5FEF",
                    textAlign: "center",
                  }}
                >
                  50+
                </Typography>
                <Typography
                  sx={{
                    color: "#333333;",
                    fontFamily: "Poppins",
                    fontWeight: "600",
                    textAlign: "center",
                    fontSize: 13,
                  }}
                >
                  Lulusan yang menjadi musisi ternama dengan skill memukau
                </Typography>
              </Stack>
            </CardContent>
          </Card>
        </Grid>
        <Grid item xs={12} sm={4} md={4}>
          <Card
            sx={{
              height: "100%",
              display: "flex",
              flexDirection: "column",
              justifyContent: "center",
              alignItems: "center",
              boxShadow: "none",
              backgroundColor: "#FFFFFF",
              borderRadius: "20px",
            }}
          >
            <CardContent sx={{ flexGrow: 1 }}>
              <Stack spacing={2}>
                <Typography
                  sx={{
                    fontSize: 40,
                    color: "#333333",
                    fontFamily: "Poppins",
                    fontWeight: "600",
                    color: "#5D5FEF",
                    textAlign: "center",
                  }}
                >
                  10+
                </Typography>
                <Typography
                  sx={{
                    color: "#333333;",
                    fontFamily: "Poppins",
                    fontWeight: "600",
                    textAlign: "center",
                    fontSize: 13,
                  }}
                >
                  Coach Special kolaborasi dengan musisi terkenal
                </Typography>
              </Stack>
            </CardContent>
          </Card>
        </Grid>
      </Grid>
    </Paper>
  );
}

export default MainFeaturedPost;
