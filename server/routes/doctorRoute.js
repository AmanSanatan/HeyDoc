import express from 'express';
import { Clinic } from '../models/Clinic.js';
import { Doctor } from '../models/Doctor.js';
import { Patient } from '../models/Patient.js';
let doctorRoute = express.Router({mergeParams:true});

// get all the doctors
doctorRoute.get('/',async(req,res)=>{
    let doctors = await Doctor.find({}).populate('clinic').populate('bookings');
    console.log("get request sent to get all the doctors");
    res.send(doctors);
})

// get a doctor with uid
doctorRoute.get('/:id',async(req,res)=>{
    let doctor = await Doctor.findOne({uid:req.params.id}).populate('clinic').populate('bookings');
    console.log("get request sent to get a specific doctor:",doctor);
    res.send(doctor);
});

// make a new doctor and set update the patient version of the doctor
doctorRoute.post('/',async(req,res)=>{
    let {name,email,uid,balance,pictureLink,clinic} = req.body;
    await Patient.findOneAndUpdate({uid:uid},{isDoctor:"true"},{new:true});
    let newClinic = new Clinic(clinic);
    await newClinic.save();
    let doctor = new Doctor({name:name,email:email,uid:uid,balance:balance,pictureLink:pictureLink,clinic:newClinic._id});
    console.log("post request sent to make a new doctor:", doctor );    
    await doctor.save();
    res.send(doctor);
});

// general route for updating a doctors data
doctorRoute.put('/:id/update',async(req,res)=>{
    let updateData = req.body;
    let {id} = req.params;
    console.log("put request sent to update a doctors data:", updateData );
    const newDoctor = await Doctor.findOneAndUpdate({uid:id},updateData,{new:true});
    res.send(newDoctor);
})
export { doctorRoute as doctorRoute };

