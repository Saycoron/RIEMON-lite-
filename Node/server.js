const http = require('http');
const express = require('express');
const bParser = require('body-parser');
const cfg = require('./utilidades/cfg');
const arduinoModel = require('./modelos/arduinoModel'); //TODO: agregar variable para controlar si la lampara esta encendida o apagada

const app = express();
const server = http.createServer(app);

let sis = new arduinoModel();

//Middleware`s
app.use(bParser.urlencoded({extended: true}));
app.use(bParser.json());

//---------------------------------------------------------------------------------------------------------------------------------- POST
app.post('/', function (req, res) {
	let action = req.body.accion;
	let maceta = req.body.maceta;
	
	let auth = req.headers['authorization'];  //auth está en base64(nombre de usuario: contraseña), por lo que debemos decodificar la base64
	//console.log(cfg.username);
	//console.log(cfg.password);
	if(!auth) {     //No se pasó ningún encabezado de autorización
		res.statusCode = 401;
		res.setHeader('WWW-Authenticate', 'Basic realm="Secure Area"');
		//res.end('{ error: Falta auth marginal }'); //TODO: descomentar cuando se arregle noti
		console.log('No envias auth');
		
		//------------------------------------------------------------------------------------------------ //TODO: Pasar a auth cuando se arregle la parte variables de entorno 
		switch(action) {
			case 'Apagar Luz':
				lamp(0);
			break;
			case 'Encender Luz':
				lamp(1);
			break;
			case 'Regar':
				irrigate(maceta);
			break;
			case 'Estado':
				console.log('Send status');
			break;
		}
		res.end(JSON.stringify(sis, null, 4));
		//------------------------------------------------------------------------------------------------ Pasar a auth cuando se arregle la parte variables de entorno
	}
	else if(auth) {   
		var tmp = auth.split(' ');   // Split 1
		var buf = new Buffer.from(tmp[1], 'base64'); 
		var plain_auth = buf.toString();        
		var creds = plain_auth.split(':');      // split 2 ':'
		var username = creds[0];
		var password = creds[1];
		
		if((username == cfg.username) && (password == cfg.password)) {
			
			res.statusCode = 200;  // OK
			console.log('Login OK');
			//res.end('<html><body>Congratulations you just hax0rd teh Gibson!</body></html>');
		}
		else {
			res.statusCode = 401; // Force them to retry authentication
			res.setHeader('WWW-Authenticate', 'Basic realm="Secure Area"');
			//res.end('<html><body>You shall not pass</body></html>');
			console.log('Login fail');
		}
	}
})

function lamp(action) {
	if (action == 1) {
		console.log('Turn on lamp');
	} else {
		console.log('Turn off lamp')
	}
}

function irrigate(plant) {
	switch(plant) {
		case '1':
		console.log('Irrigate plant 1');
		break;
		case '2':
		console.log('Irrigate plant 2');
		break;
		case '3':
		console.log('Irrigate plant 3');
		break;
	}
}

server.listen(3000, () => console.log('server on port 3000'));