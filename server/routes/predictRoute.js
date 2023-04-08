import { spawn } from 'child_process';
import express from 'express';
import fs from 'fs';
import https from 'https';
let predictRoute = express.Router({mergeParams:true});
async function saveImageLocally(url,id,wave){
    let path;
    if(wave)
    path = "./Model/data/"+id+"_wave.png";
    else path = "./Model/data/"+id+"_spiral.png";
    const localPath = fs.createWriteStream(path);
    const request = https.get(url,(res)=>{
        res.pipe(localPath);
    })
}
function deleteLocalImage(id){
    fs.unlinkSync("./Model/data/"+id+"_wave.png");
    fs.unlinkSync("./Model/data/"+id+"_spiral.png");
}
predictRoute.post('/:id',async(req,res)=>{
    let {url_wave,url_spiral} = req.body;
    let {id} = req.params;
    await saveImageLocally(url_wave,id,true);
    await saveImageLocally(url_spiral,id,false);
    const python = spawn('python',['Model/predict.py',id]);
    let predict = 0;
    python.stdout.on('data',(data)=>{
        console.log("Getting data from python script..");
        predict = data.toString();
    })
    python.on('close',(code)=>{
        console.log(`child process exited with code ${code}`);
        deleteLocalImage(id);
        res.send(predict);
    })
})
export { predictRoute as predictRoute };

