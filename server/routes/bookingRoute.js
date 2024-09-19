import express from 'express';
import { Booking } from '../models/Booking.js';
import { Doctor } from '../models/Doctor.js';
import { Patient } from '../models/Patient.js';
//if you want to inherit parameters of parent routes, set mergeParams to true
const bookingRoute = express.Router({mergeParams:true});

// route to get all the bookings
bookingRoute.get('/',async(req,res)=>{
    const bookings = await Booking.find({});
    console.log("get request sent on the booking route to get all the bookings");
    res.send(bookings);
})

// to post a new booking
bookingRoute.post('/',async(req,res)=>{
    const booking = new Booking(req.body);
    await booking.save();
    let doc = await Doctor.findOne({uid:booking.doctorId});
    let newBalance = parseInt(doc.balance);
    newBalance = newBalance + parseInt(booking.cost);
    await Doctor.findOneAndUpdate({uid:booking.doctorId},{$push:{bookings:booking},balance:newBalance});
    await Patient.findOneAndUpdate({uid:booking.patientId},{$push:{bookings:booking}});
    console.log("post request sent to make a new booking",booking);
    res.send(booking);
})
export { bookingRoute };

