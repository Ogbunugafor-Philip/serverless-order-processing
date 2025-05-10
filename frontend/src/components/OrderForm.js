import React, { useState } from "react";

const OrderForm = () => {
  const [product, setProduct] = useState("");
  const [quantity, setQuantity] = useState("");
  const [response, setResponse] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();

    const token = localStorage.getItem("jwtToken");
    if (!token) return alert("User not authenticated.");

    try {
      const res = await fetch("https://agegrwcu30.execute-api.us-east-1.amazonaws.com/orders", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({ product, quantity }),
      });

      const data = await res.json();
      setResponse(JSON.stringify(data, null, 2));
    } catch (err) {
      setResponse(`Error: ${err.message}`);
    }
  };

  return (
    <div>
      <h3>Submit Order</h3>
      <form onSubmit={handleSubmit}>
        <input
          value={product}
          onChange={(e) => setProduct(e.target.value)}
          placeholder="Product"
          required
        />
        <input
          value={quantity}
          onChange={(e) => setQuantity(e.target.value)}
          placeholder="Quantity"
          type="number"
          required
        />
        <button type="submit">Submit</button>
      </form>
      {response && <pre>{response}</pre>}
    </div>
  );
};

export default OrderForm;
