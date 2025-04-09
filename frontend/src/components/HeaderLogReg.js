import { Typography, Box } from "@mui/material";
import React from "react";

function HeaderLogReg(props) {
  return (
    <Box
      sx={{
        display: "flex",
        flexDirection: "column",
        justifyContent: "flex-start",
        mt: 7,
      }}
    >
      <Typography
        sx={{
          fontFamily: "poppins",
          fontStyle: "normal",
          lineHeight: "36px",
          fontSize: 24,
          color: "#333333",
        }}
      >
        {props.primary}
      </Typography>
      <Typography
        sx={{
          fontFamily: "poppins",
          fontStyle: "normal",
          lineHeight: "24px",
          fontSize: 16,
          color: "#4F4F4F",
          mt: 3,
          mb: 6,
        }}
      >
        {props.secondary}
      </Typography>
    </Box>
  );
}

export default HeaderLogReg;
