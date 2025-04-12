const express = require('express');
const db = require('../database');
const router = express.Router();

router.get('/', (req, res, next)=>{
    res.render('index', {title: "Index"});
    res.end();
});

router.get('/register', (req, res, next)=>{
    res.render('register', {title: "Register"});
    res.end();
});

router.get('/login', (req, res, next)=>{
    res.render('login', {title: "Login"});
    res.end();
});

router.get('/welcome', (req, res, next)=>{
    var query = `SELECT * FROM employees ORDER by eid DESC `;
    db.query(query, (error, data)=>{
        if (error) throw error;
        else
            res.render('welcome', {title: "Welcome", empData: data});
    });
   
});

router.get('/addEmployee', (req, res, next)=>{
    res.render('addEmployee', {title: "Add"});
    res.end();
});

router.get('/editEmployee', (req, res, next)=>{
    var eid = req.params.eid;
    var query = `SELECT * FROM employees WHERE eid = '${eid}' `;
    
    db.query(query, (error, data)=>{
        if (error) 
        {   
            res.status(401);
            console.log("Employee Data not found");
            res.redirect('/ems/editEmployee');
        }   
        else
        {
            res.status(200);
            console.log("Employee Data found");
            res.render('editEmployee', {title: "Edit", empData: data[eid]});
        }
        res.end();    
    });
});


router.post('/login', (req, res, next) => {
    var username = req.body.username;
    var password = req.body.password;
    var role = req.body.role;

    var query =`SELECT * FROM users WHERE 
                username=? and password=? and role=? `;
    
    db.query(query, [username, password, role], (error, rows)=>{
        if (error) throw error; 
        if(rows.length<=0)
        {
            console.log("Invalid credentials");
            res.status(500).send("Invalid credentials");
        }
        else{
            res.status(200);
            console.log("Login Success");
            res.redirect("/ems/welcome");
        }
        res.end();
    });
});


router.post("/register", (req, res, next) => {
    var username = req.body.username;
    var password = req.body.password;
    var contact = req.body.contact;
    var role = req.body.role;

    var query = `INSERT INTO users(username, password, contact, role) 
    VALUES("${username}","${password}","${contact}","${role}")`;
    db.query(query, (error)=>{
        if (error)
        {
            res.status(500);
            console.log("Something went wrong");
            res.redirect('/ems/register');
        }     
        else{
            res.status(200);
            console.log("Person inserted successfully");
            res.redirect('/ems/login');
        }
        res.end();    
    });

});

router.post("/addEmployee", (req, res, next) => {
    var name = req.body.name;
    var desig = req.body.desig;
    var dpmnt = req.body.dpmnt;
    var email = req.body.email;
    var contact = req.body.contact;

    var query = `INSERT INTO employees(name, desig, dept, email, contact) 
    VALUES("${name}","${desig}","${dpmnt}","${email}", "${contact}")`;
    db.query(query, (error)=>{
        if (error)
        {
            res.status(500);
            console.log("Something went wrong");
            res.redirect('/ems/addEmployee');
        }     
        else{
            res.status(200);
            console.log("Employee inserted successfully");
            res.redirect('/ems/welcome');
        }
        res.end();    
    });

});

router.post("/editEmployee/:eid", (req, res, next) => {
    var eid = req.params.eid;
    var name = req.body.name;
    var desig = req.body.desig;
    var dpmnt = req.body.dpmnt;
    var email = req.body.email;
    var contact = req.body.contact;

    var query = `UPDATE employees SET  name=?, designation=?, dpmnt=?, email = ?, contact = ?
    WHERE eid = '${eid}' `;
       db.query(query,[name, desig, dpmnt, email, contact], (error)=>{
        if (error)
        {
            res.status(500);
            console.log("Something went wrong");
            res.redirect('/ems/editEmployee');
        }     
        else{
            res.status(200);
            console.log("Employee updated successfully");
            res.redirect('/ems/welcome');
        }
        res.end();    
    });

});

module.exports = router;
