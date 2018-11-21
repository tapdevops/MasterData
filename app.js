/*
 * author : whenawijanarko08@gmail.com
 *
 * */
'use strict'

const bodyParser = require('body-parser')
const cors = require('cors')
const express = require('express')
const logger = require('morgan')

const app = express()

// middleware
app.use(cors())
app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
    extended: true
}))

    // for security disable the X-Powered-By header
app.disable('x-powered-by')


// GET method route
app.get('/',  (req, res) => {
  res.send('Hello world')
})

// catch 404 and forward to error handler
app.use((req, res, next) => {
    const err = new Error('Not Found')
    err.status = 404
    next(err)
})

// error handler
// no stacktraces leaked to user unless in development environment
app.use((err, req, res, next) => {
    res.status(err.status || 500)
        .send({
            message: err.message,
            code: err.code || 0
        })
})


/*create server http or https*/
const server = require('http').createServer(app);


/*
 |--------------------------------------------------------------------------
 | Start the Server
 | !module.parent === avoid error Uncaught error outside test suite:
 |--------------------------------------------------------------------------
 */
if (!module.parent) {
    server.listen(3006, () => {
        console.log('Express server listening on port 3006!')
    })
}

module.exports = app

















// Import Express
//const express = require( 'express' );

// Import Mongoose
//const mongoose = require( 'mongoose' );

// Import Body Parser
//const bodyParser = require( 'body-parser' );

// Configuring the Database
//const dbConfig = require( './config/database.js' );

// Configuring configuration
//const config = require( './config/config.js' );

// Define App
//const app = express();

// Parse request of content-type - application/x-www-form-urlencoded
//app.use( bodyParser.urlencoded( { extended: true } ) )

// Parse request of content-type - application/json
//app.use( bodyParser.json() )

// Setup Database
//mongoose.Promise = global.Promise;

// Connecting to the database
//mongoose.connect( dbConfig.url, {
	//useNewUrlParser: true,
	//ssl: true
//} ).then( () => {
//	console.log( 'Successfully connected to the Database' );
//} ).catch( err => {
	//console.log( 'Could not connect to the Database. Exiting application.' )
//} );

// Server Running Message
//app.listen( config.app_port, () => {
//	console.log( config.app_name + ' running on ' + config.app_port )
//} );

// Routes
//app.get( '/', ( req, res ) => {
//	res.json( { 'message': config.app_name } )
//} );

// Require Bisnis Area Routes
//require( './routes/route.js' )( app );
