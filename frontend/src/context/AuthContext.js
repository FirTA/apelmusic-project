import { createContext, useState, useEffect } from "react";
import userServices from "../services/userServices";

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [loadAuth, setLoadAuth] = useState(true);
  const [auth, setAuth] = useState(null);
  const [auth2, setAuth2] = useState("default");

  useEffect(() => {
    const token = localStorage.getItem("token");
    setLoadAuth(true);
    if (token) {
      // console.log("start validate token......");
      userServices
        .validateToken(token)
        .then((res) => {
          console.log("response validate token :\n", res);
          localStorage.setItem("token", res.data.token);
          setAuth(res.data);
        })
        .catch((e) => {
          localStorage.removeItem("token");
          console.log(e);
        })
        .finally(() => {
          setLoadAuth(false);
        });
    } else {
      setLoadAuth(false);
    }
  }, []);

  // useEffect(() => {
  //   console.log("change auth:", auth);
  // }, [auth]);

  return (
    <AuthContext.Provider
      value={{ auth, setAuth, auth2, setAuth2, loadAuth, setLoadAuth }}
    >
      {children}
    </AuthContext.Provider>
  );
};

export default AuthContext;
