import * as React from "react";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import { Link as RouterLink } from "react-router-dom";

export default function CardCourse({ course }) {
  const numberToRupiah = (number) => {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  };
  return (
    <Card
      sx={{
        height: "100%",
        display: "flex",
        flexDirection: "column",
        boxShadow: "none",
        textAlign: "left",
      }}
    >
      <RouterLink to={"/course/" + course.id_course}>
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
          to={"/course/" + course.id_course}
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
            fontWeight: "600",
          }}
        >
          Rp {numberToRupiah(course.harga)}
        </Typography>
      </CardContent>
    </Card>
  );
}
