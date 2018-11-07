// Import Express
const express = require( 'express' );

// Import Mongoose
const mongoose = require( 'mongoose' );

// Import Body Parser
const bodyParser = require( 'body-parser' );

// Configuring the Database
const dbConfig = require( './config/database.js' );

// Configuring configuration
const config = require( './config/config.js' );

// Define App
const app = express();

// Parse request of content-type - application/x-www-form-urlencoded
app.use( bodyParser.urlencoded( { extended: true } ) )

// Parse request of content-type - application/json
app.use( bodyParser.json() )

// Setup Database
mongoose.Promise = global.Promise;

// Connecting to the database
mongoose.connect( dbConfig.url, {
	useNewUrlParser: true,
	ssl: true
} ).then( () => {
	console.log( 'Successfully connected to the Database' );
} ).catch( err => {
	console.log( 'Could not connect to the Database. Exiting application.' )
} );

// Server Running Message
app.listen( config.app_port, () => {
	console.log( config.app_name + ' running on ' + config.app_port )
} );

// Routes
app.get( '/', ( req, res ) => {
	res.json( { 'message': config.app_name } )
} );

// Require Bisnis Area Routes
require( './routes/route.js' )( app );