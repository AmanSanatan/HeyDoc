import mongoose from 'mongoose';
import {Clinic} from '../models/Clinic.js';
import {Doctor} from '../models/Doctor.js';
import express from 'express';
let clinicRoute = express.Router();

// get all the clinics
clinicRoute.get('/',async(req,res)=>{
    let clinics = await Clinic.find({});
    console.log("get request sent to get all the clinics");
    res.send(clinics);
})

// add a clinic
clinicRoute.post('/:id/addClinic',async(req,res)=>{
    let clinicData = req.body;
    let {id} = req.params;
    let clinic = new Clinic(clinicData);
    await clinic.save();
    console.log("put request sent to make a new Clinic:",clinic);
    const newDoctor = await Doctor.findOneAndUpdate({uid:id},{$set:{clinic:clinic}},{new:true}).populate('clinic');
    console.log("post request sent to make a new clinic and update doctors clinic at the same time", clinic,newDoctor);
    res.send(newDoctor);
})

// update a clinic
clinicRoute.put('/:id/updateClinic',async(req,res)=>{
    let updateData = req.body;
    let {id} = req.params ;
    let newClinic = await Clinic.findOneAndUpdate({doctorUid:id},updateData,{new:true});;
    console.log("update request sent to update a clinic:",newClinic);
    res.send(newClinic);
})
export {clinicRoute as clinicRoute};