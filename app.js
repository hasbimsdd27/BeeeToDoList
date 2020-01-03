const express = require('express');
const path = require('path');
const app = express();
const port = 3001;
const dbConn = require('./lib/mysql/connection.js');
const bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({extended : false}));

app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'ejs');

app.get('/',(req,res)=>{
    let dataJudul = 'Selamat Datang';
    let dataSifat = [];
    dbConn.query('SELECT * FROM sifat', (err,data)=>{
        dataSifat = data
    })
    dbConn.query('SELECT * FROM aktivitas INNER JOIN sifat ON sifat.id = aktivitas.kondisi',(err,data)=>{
        res.render('index',{dataKegiatan: data, dataJudul, dataSifat});
    })
    
})

app.get('/add', (req,res)=>{
    res.redirect('/')
})

app.post('/create',(req,res)=>{
    const {kegiatan, deskripsi,kondisi} = req.body;
    dbConn.query('INSERT INTO aktivitas SET ?', {kegiatan, deskripsi, kondisi}, (err)=>{
        if (err) throw err;
        res.redirect('back');
    });
})

app.get('/delete', (req, res) => {
    const {no} = req.query;
    dbConn.query('DELETE FROM aktivitas WHERE no = ?', no, (err)=>{
        if (err) throw err;
        res.redirect('/');
    }); 
});

app.post('/update',(req,res) => {
    const {no,kegiatan,deskripsi,kondisi} = req.body;
    dbConn.query("UPDATE aktivitas SET kegiatan='"+kegiatan+"',deskripsi='"+deskripsi+"',kondisi="+kondisi+' WHERE no='+no, (err)=>{
        if (err) throw err;
        res.redirect('/');
    });
});

app.get('/done',(req,res) => {
    const {no} = req.query
    dbConn.query("UPDATE aktivitas SET done= 'sudah' WHERE no="+no, (err)=>{
        if (err) throw err;
        res.redirect('/');
    });
});


app.listen(port, () => {
    console.log('listening on port ' + port);
});