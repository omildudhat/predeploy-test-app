const express = require("express");

const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.json({
    service: "payments-service",
    status: "healthy"
  });
});

app.listen(port, () => {
  console.log(`Payments service listening on port ${port}`);
});
