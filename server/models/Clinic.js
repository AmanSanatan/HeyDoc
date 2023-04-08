import mongoose from 'mongoose';
const ClinicSchema = new mongoose.Schema({
    clinicName : String, 
    doctorName : String, 
    doctorImage : String, 
    lat : String,
    lng : String,
    pictureLink : String, 
    phoneNumber : String,
    description : String, 
    rating : String,
    doctorUid : String, 
    price : String   
});
const Clinic = mongoose.model('Clinic',ClinicSchema,'Clinic');
export { Clinic as Clinic };

