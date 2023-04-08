import express from 'express';
import { Patient } from '../models/Patient.js';
let patientRoute = express.Router({mergeParams:true});

// get all patients on db
patientRoute.get('/',async(req,res)=>{
    let patients = await Patient.find({}).populate('bookings');
    console.log("get request sent to get all the patients");
    res.send(patients);
}) 

// get a patient with uid
patientRoute.get('/:id',async(req,res)=>{
    console.log(req.params.id);
    let patient = await Patient.findOne({uid:req.params.id}).populate('bookings');
    console.log("get request sent to get a patient with a specific uid:",patient );
    if(patient === null){        
        let dummy = await Patient.findOne({uid:"error"});
        res.send(dummy);
    } else {
        res.send(patient);
    }
})
// add a new patient
patientRoute.post('/',async(req,res)=>{
    const {name,email,pictureLink,uid,isDoctor} = req.body; 
    console.log("patient data received : ",req.body);
    let alreadypresent = await Patient.findOne({uid:uid});
    if(alreadypresent){
        res.status(404);
        return res.send("User already present");
    }
    let patient = new Patient({name:name,email:email,pictureLink:pictureLink,uid:uid,isDoctor:isDoctor});
    console.log("post request sent to make a new patient:",patient);
    await patient.save();
    res.send(patient);
})

//update an existing patient
patientRoute.put('/:id/update',async(req,res)=>{
    let patientData = req.body;
    let {id} = req.params;
    console.log("put request sent to update a patient data:", patientData);
    const newPatient = await Patient.findOneAndUpdate({uid:id},patientData,{new:true});
    res.send(newPatient);
})
export { patientRoute as patientRoute };

