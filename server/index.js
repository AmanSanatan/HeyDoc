import express from 'express';
import mongoose from 'mongoose';
import { bookingRoute } from './routes/bookingRoute.js';
import { doctorRoute } from './routes/doctorRoute.js';
import { patientRoute } from './routes/patientRoute.js';
import { clinicRoute } from './routes/clinicRoute.js';
import { predictRoute } from './routes/predictRoute.js';
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
app.use(express.urlencoded({extended:true}));
app.use(express.json());
app.use('/patient',patientRoute);
app.use('/doctor',doctorRoute);
app.use('/booking',bookingRoute);
app.use('/clinic',clinicRoute);
app.use('/predict',predictRoute);