const express = require("express");

const app = express()

app.get('/',(res,req)=>{
    res.json({msg : "Hello World !!!"});
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, ()=>{
    console.log("SERVER STARTED !");
});