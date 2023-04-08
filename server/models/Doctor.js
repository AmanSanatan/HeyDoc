import mongoose from 'mongoose';
const DoctorSchema = new mongoose.Schema({
    name:String,
    email:String,
    pictureLink: String,
    clinic: {
        type: mongoose.Types.ObjectId,
        ref : 'Clinic'
    },
    bookings: [{
        type: mongoose.Types.ObjectId,
        ref : 'Booking'
    }],
    uid : String,
    balance : String
})
const Doctor = mongoose.model('Doctor',DoctorSchema,'Doctor');
export { Doctor as Doctor };

