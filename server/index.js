import express from 'express';
import methodOverride from 'method-override';
import mongoose from 'mongoose';
import { patientRoute } from './routes/patientRoute.js' ;
let app = express();
app.listen(3000,(res)=>{
    console.log("Listening on port");
})
const uri = "mongodb+srv://sanatan:hackfest@cluster0.a2sbwvj.mongodb.net/heyDoc?retryWrites=true&w=majority";
mongoose.connect(uri,  {
        useNewUrlParser: true,
        useUnifiedTopology: true
      })
    .then((res)=>{
        console.log("Connection successful");
    })
    .catch((err)=>{
        console.log(err);
    })
app.use('/patient',patientRoute);