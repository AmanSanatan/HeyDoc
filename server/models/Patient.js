import mongoose from 'mongoose';
const PatientSchema = new mongoose.Schema({
    name : String,
    email : String, 
    pictureLink : String,
    bookings : [{
        type: mongoose.Types.ObjectId,
        ref: 'Booking'
    }],
    uid : String,
    isDoctor: String
})
const Patient = mongoose.model('Patient',PatientSchema,'Patient');
export { Patient as Patient };
