import mongoose from 'mongoose';
const BookingSchema = new mongoose.Schema({
    date: String, 
    time: String,
    meetLink: String, 
    patientName: String,
    patientId : String,
    doctorName: String,
    doctorId: String,
    clinicName: String,
    cost: String
})
const Booking = mongoose.model('Booking',BookingSchema,'Booking');
export { Booking as Booking };

