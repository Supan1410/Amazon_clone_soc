const express = require("express");
const moongoose = require("mongoose");

const authRouter = require("./routes/auth");
const { default: mongoose } = require("mongoose");


const port = 3000;
const app = express();
const db= "mongodb+srv://supan:Supan@cluster1.xqv3ff5.mongodb.net/?retryWrites=true&w=majority&appName=Cluster1";

app.use(express.json());
app.use(authRouter);

mongoose.connect(db).then(() => {
    console.log("Connected to MongoDB");
}).catch((err) => {
    console.error("Error connecting to MongoDB:", err);
});

app.listen(port,"0.0.0.0", () => {
    console.log(`Server is running at http://localhost:${port}`);
    }   );