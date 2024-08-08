import express from 'express';
import { CaptureContext } from '@sentry/types';
import { createHandler } from 'graphql-http/lib/use/express';
import path from 'path';
import compression from 'compression';
import cookieParser from 'cookie-parser';
import requestLanguage from 'express-request-language';
import bodyParser from 'body-parser';
import expressJwt from 'express-jwt';

import cors from 'cors';
import jwt from 'jsonwebtoken';
import './serverIntlPolyfill';
import passport from './core/passport';
import models, { User } from './data/models';
import schema from './data/schema';

import { auth, locales, port, websiteUrl } from './config-sample';

// Social Media Authentication
import facebookAuth from './core/auth/facebook';
import googleAuth from './core/auth/google';

// File Upload
import fileUpload from './core/fileUpload';
import documentUpload from './core/documentUpload';
import logoUpload from './core/logoUpload';
import locationUpload from './core/locationUpload';
import profilePhotoUpload from './core/profilePhotoUpload';
import bannerUpload from './core/bannerUpload';
import downloadRoute from './core/download/downloadRoute';
import csvRoutes from './core/csv/csvRoutes';
import homeBannerUpload from './core/homeBannerUpload';
import amenitiesUpload from './core/amenitiesUpload';
import favIconUpload from './core/favIconUpload';

// For Emails
import sendEmail from './core/email/emailSetup';

// Payment Gateway
import paypalRoutes from './core/payment/paypal';
import payoutRoutes from './core/payment/payout/payoutRoutes';
import refundRoutes from './core/payment/refund/refundRoutes';

// CRON Jobs
import cron from './core/cron/cron';
import reservationExpire from './core/cron/reservationExpire';
import reservationComplete from './core/cron/reservationComplete';
import updateListStatus from './core/cron/updateListStatus';
// import updateReviewCount from './core/cron/updateReviewCount';
import autoPayoutToHost from './core/cron/autoPayoutToHost';
import splitAndShareSubguestAccept from './core/cron/splitAndShareSubguestAccept';
import couponExpire from './core/cron/couponExpire';

// iCal Routes
import iCalRoutes from './core/iCal/iCalRoutes';
import iCalCron from './core/iCal/iCalCron';
import exportICalRoutes from './core/iCal/exportIcal/exportRoutes';

// Stripe
import stripePayment from './core/payment/stripe/stripePayment';
import stripeRefund from './core/payment/stripe/stripeRefund';
import stripePayout from './core/payment/stripe/stripePayout';
import stripeAddPayout from './core/payment/stripe/stripeAddPayout';
import stripePaymentRepost from './core/payment/stripe/stripeRepost';

// Twilio SMS
import TwilioSms from './core/sms/twilio/sendSms';

// Mobile API helper routes
import mobileRoutes from './core/mobileRoutes';
import uploadListPhotoMobile from './core/uploadListPhotoMobile';

import pushNotificationRoutes from './core/pushNotifications/pushNotificationRoutes';

import * as Sentry from '@sentry/node';
import { ProfilingIntegration } from '@sentry/profiling-node';

const app = express();

Sentry.init({
  // dsn: 'https://b0af7d2482804c8e46a98ade8c063b0a@o4506247252541440.ingest.sentry.io/4506252122587136',
  dsn: 'https://0f7e6df3f73107b336d054bf79342cf6@o4507566828945408.ingest.us.sentry.io/4507566831763456',
  integrations: [
    // enable HTTP calls tracing
    new Sentry.Integrations.Http({ tracing: true }),
    // enable Express.js middleware tracing
    new Sentry.Integrations.Express({ app }),
    new ProfilingIntegration(),
  ],
  // Performance Monitoring
  tracesSampleRate: 1.0,
  // Set sampling rate for profiling - this is relative to tracesSampleRate
  profilesSampleRate: 1.0,
});
// The request handler must be the first middleware on the app
app.use(Sentry.Handlers.requestHandler());

// TracingHandler creates a trace for every incoming request
app.use(Sentry.Handlers.tracingHandler());

app.use(compression());

const corsOptions = {
  origin: websiteUrl,
  credentials: true,
  methods: ['GET', 'POST', 'OPTIONS', 'PUT', 'DELETE'],
  exposedHeaders: ['Token'],
};

app.use(cors(corsOptions));

//
// Tell any CSS tooling (such as Material UI) to use all vendor prefixes if the
// user agent is not known.
// -----------------------------------------------------------------------------
global.navigator = global.navigator || {};
global.navigator.userAgent = global.navigator.userAgent || 'all';

//
// Register Node.js middleware
// -----------------------------------------------------------------------------
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '../static')));
app.use(
  requestLanguage({
    languages: locales,
    queryName: 'lang',
    cookie: {
      name: 'lang',
      options: {
        path: '/',
        maxAge: 3650 * 24 * 3600 * 1000, // 10 years in miliseconds
      },
      url: '/lang/{language}',
    },
  }),
);
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

//
// Authentication
// -----------------------------------------------------------------------------
app.use(function (req, res, next) {
  res.setHeader(
    'Access-Control-Allow-Headers',
    'X-Requested-With,content-type, Authorization',
  );
  next();
});
app.use(
  expressJwt({
    ignoreExpiration: true,
    secret: auth.jwt.secret,
    credentialsRequired: false,
    getToken: req => req.headers.authorization || req.cookies.id_token,
  }),
);

app.use(passport.initialize());

app.post('/auth/validate', (req, res) => {
  try {
    const token = req.headers.authorization;
    const decoded = jwt.verify(token, auth.jwt.secret, {
      ignoreExpiration: true,
    });
    res.status(200).send(decoded);
  } catch (e) {
    res.status(401).send();
  }
});

if (!process.argv.includes('--release')) {
  app.enable('trust proxy');
}

// Authentication
facebookAuth(app);
googleAuth(app);

// File Upload
fileUpload(app);

//doucment upload
documentUpload(app);

// Logo Upload
logoUpload(app);

// Location Upload
locationUpload(app);

//Profile Photo Upload
profilePhotoUpload(app);

// Profile Photo upload from social media
downloadRoute(app);

// For Export CSV files
csvRoutes(app);

// Banner Upload
bannerUpload(app);
homeBannerUpload(app);

//Amenities
amenitiesUpload(app);

// Send Email Function
sendEmail(app);

// Payment Gateway
paypalRoutes(app);
payoutRoutes(app);
refundRoutes(app);

// Cron Job
cron(app);
reservationExpire(app);
reservationComplete(app);
updateListStatus(app);
// updateReviewCount(app);
autoPayoutToHost(app);
splitAndShareSubguestAccept(app);
couponExpire(app);

// iCal
iCalRoutes(app);
iCalCron(app);
exportICalRoutes(app);

// Stripe
stripePayment(app);
stripeRefund(app);
stripePayout(app);
stripeAddPayout(app);
stripePaymentRepost(app);

// Twilio -SMS
TwilioSms(app);

// Mobile API helper routes
mobileRoutes(app);
uploadListPhotoMobile(app);

// Site Map
// sitemapRoutes(app, routes);
pushNotificationRoutes(app);

// Favicon
favIconUpload(app);

// app.post("/logout", function(req, res) {
//   res.clearCookie("id_token");
//   res.redirect("/");
// });

//
// Register API middleware
// -----------------------------------------------------------------------------
// const graphqlMiddleware = graphqlHTTP((req, res) => ({
//   schema,
//   graphiql: !process.argv.includes('--release'),
//   rootValue: {
//     request: req,
//     response: res,
//   },
//   pretty: !process.argv.includes('--release'),
// }));
app.all(
  '/graphql',
  createHandler({
    schema,
    context: (req, res, r, b, s) => {
      return { request: req.raw, response: req.raw.res };
    },
    onSubscribe: (request, params) => {
      // return params.variables;
    },
    onOperation: (request, params) => {},
    formatError: err => {
      var id = Sentry.captureException(err.originalError, {
        contexts: {
          full_message: { message: err.message },
        },
      });
      console.log('formatError', err.message);
      // console.log("formatError", err);
      return err;
    },
  }),
);

app.get('/debug-sentry', function mainHandler(req, res) {
  throw new Error('My first Sentry error!');
});

// The error handler must be before any other error middleware and after all controllers
app.use(Sentry.Handlers.errorHandler());
app.use(function (err, req, res, next) {
  if (err.name === 'UnauthorizedError') {
    res.status(401).send();
  } else {
    res.status(500).send({
      error: err,
    });
  }
});
console.info('Waiting to launch server...');

app.listen(port, () => {
  console.info(`The server is running at http://localhost:${port}/`);
});
export default app;
