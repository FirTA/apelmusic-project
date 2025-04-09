import React from "react";
import { useState, useRef, useEffect, useContext } from "react";

import { HeaderContext } from "../context/HeaderContext";

export default function SetContextHeader() {
  const { updateHeader } = useContext(HeaderContext);
  const { header } = useContext(HeaderContext);
  const variant = localStorage.getItem("role") ?? "guest";

  useEffect(() => {
    updateHeader({
      variant: variant,
      backgroundColor: "#F2C94C",
    });
    // console.log(variant);
  }, [variant]);
  return;
}
