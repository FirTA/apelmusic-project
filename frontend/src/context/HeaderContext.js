import React, { useState, createContext, useEffect } from "react";

const HeaderContext = createContext();

const HeaderProvider = ({ children }) => {
  const notes = localStorage.getItem("role") ?? "guest";
  const [header, setHeader] = useState({
    variant: notes,
    // variant: "guest",
    // variant: "admin",
    backgroundColor: "#F2C94C",
  });

  // useEffect(() => {
  //   console.log("===== HeaderContext =====");
  // }, []);

  const updateHeader = (newState) => {
    setHeader({ ...header, ...newState });
  };

  useEffect(() => {
    // console.log("header context variant: ", notes);
    setHeader((prevValue) => {
      return { ...prevValue, variant: notes };
    });
  }, [notes]);

  return (
    <HeaderContext.Provider value={{ header, updateHeader }}>
      {children}
    </HeaderContext.Provider>
  );
};

export { HeaderContext, HeaderProvider };
