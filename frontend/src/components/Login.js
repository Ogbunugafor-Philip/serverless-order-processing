import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { signIn } from "../services/AuthService";

const Login = () => {
  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const result = await signIn(email, password);
      const token = result.AuthenticationResult.IdToken;

      // Save token (you can use localStorage or context)
      localStorage.setItem("jwtToken", token);

      // Redirect to dashboard
      navigate("/dashboard");
    } catch (err) {
      alert(`Login failed: ${err.message}`);
    }
  };

  return (
    <div>
      <h2>Login</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="email"
          placeholder="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        <input
          type="password"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        <button type="submit">Log In</button>
      </form>
    </div>
  );
};

export default Login;

