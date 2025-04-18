import * as React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Header from "./components/Header";
import { HeaderProvider } from "./context/HeaderContext";
import Payment from "./pages/admin/Payment";
import User from "./pages/admin/User";
import CategoryPage from "./pages/CategoryPage";
import CheckoutPage from "./pages/CheckoutPage";
import CoursePage from "./pages/CoursePage";
import EmailConfirmSuccess from "./pages/EmailConfirmSuccess";
import HomePage from "./pages/HomePage";
import Kelasku from "./pages/Kelasku";
import Invoice from "./pages/Invoice";
import InvoiceDetail from "./pages/InvoiceDetail";
import LoginPage from "./pages/LoginPage";
import RegisterPage from "./pages/RegisterPage";
import ResetPasswordConfirmEmail from "./pages/ResetPasswordConfirmEmail";
import ResetPasswordPage from "./pages/ResetPasswordPage";
import AdminRoutes from "./routes/AdminRoutes";
import ProtectedRoutes from "./routes/ProtectedRoutes";
import SuccessPurchase from "./pages/SuccessPurchase";
import NonLoggedRoutes from "./routes/NonLoggedRoutes";

function App() {
  return (
    <Router>
      <HeaderProvider>
        <Header />
        <Routes>
          {/* Admin Route  */}
          <Route element={<AdminRoutes />}>
            <Route path="/user" element={<User />} />
            <Route path="/payment" element={<Payment />} />
            <Route path="/invoice" element={<Invoice />} />
            <Route path="/invoicedetail/:id" element={<InvoiceDetail />} />
          </Route>

          {/* Non Login Route */}
          <Route element={<NonLoggedRoutes />}>
            <Route path="/login" element={<LoginPage />} />
            <Route path="/register" element={<RegisterPage />} />
            <Route
              path="/resetpassword-newpass/:token"
              element={<ResetPasswordPage />}
            />
            <Route
              path="/resetpassword-emailconfirm"
              element={<ResetPasswordConfirmEmail />}
            />
            <Route
              path="/emailconfirmsuccess/:token"
              element={<EmailConfirmSuccess />}
            />
            <Route />
          </Route>

          {/* Guest Route */}
          <Route path="/home" element={<HomePage />} />
          <Route path="/" element={<HomePage />} />
          <Route path="/category/:id" element={<CategoryPage />} />
          <Route path="/course/:id" element={<CoursePage />} />

          {/* Peserta Route */}
          <Route element={<ProtectedRoutes />}>
            <Route path="/successpurchase/:id" element={<SuccessPurchase />} />
            <Route path="/invoiceuser" element={<Invoice />} />
            <Route path="/invoiceuserdetail/:id" element={<InvoiceDetail />} />
            <Route path="/kelasku" element={<Kelasku />} />
            <Route path="/checkout" element={<CheckoutPage />} />
          </Route>
        </Routes>
      </HeaderProvider>
    </Router>
  );
}

export default App;
