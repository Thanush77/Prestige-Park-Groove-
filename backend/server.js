import express from 'express';
import bodyParser from 'body-parser';
import bcrypt from 'bcrypt';
import cors from 'cors';
import Joi from 'joi';
import pkg from 'pg';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const app = express();
const port = 3000;
const { Client } = pkg;

app.use(cors());
app.use(bodyParser.json());


app.use((req, res, next) => {
  res.setHeader(
    'Content-Security-Policy',
    "default-src 'self'; " +
    "font-src 'self' data: http://54.146.215.18:3000; " +
    "style-src 'self' 'unsafe-inline'; " +
    "script-src 'self' 'unsafe-inline' 'unsafe-eval'; " +
    "img-src 'self' data: blob: http://54.146.215.18:3000"
  );
  next();
});

// const client = new Client({
//   host: 'localhost',
//   user: 'thanush',
//   password: 'user',
//   database: 'test',
//   port: 5432,
// });

// const client = new Client({
//   host: 'thanush1.cb4e4w6y2od4.us-east-1.rds.amazonaws.com',
//   user: 'thanush',
//   password: 'Thanush04',
//   database: 'thanush',
//   port: 5432,
// });
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const sslConfig = {
  rejectUnauthorized: true, // Recommended for production to verify server certificate
  ca: fs.readFileSync(path.join(__dirname, 'us-east-1-bundle.pem')).toString()// Path to RDS root certificate
};


const client = new Client({
  host: 'thanush1.cb4e4w6y2od4.us-east-1.rds.amazonaws.com',
  user: 'thanush',
  password: 'Thanush04',
  database: 'thanush',
  port: 5432,
  ssl: sslConfig // Add SSL configuration
});
// Database connection
client.connect()
  .then(() => console.log('Connected to PostgreSQL'))
  .catch(err => console.error('Error connecting to PostgreSQL:', err));

// Updated table creation to match Flutter app fields
const createUsersTable = `
  CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    company VARCHAR(255) NOT NULL,
    designation VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  )
`;

client.query(createUsersTable)
  .then(() => console.log('Users table created or already exists.'))
  .catch(err => console.error('Error creating users table:', err));


  const createWaterConsumptionTable = `
  CREATE TABLE IF NOT EXISTS water_consumption (
    id SERIAL PRIMARY KEY,
    total INTEGER NOT NULL,
    this_month INTEGER NOT NULL,
    today INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  )
`;

client.query(createWaterConsumptionTable)
  .then(() => console.log('Water Consumption table created or already exists.'))
  .catch(err => console.error('Error creating water consumption table:', err));

const waterConsumptionSchema = Joi.object({
  total: Joi.number().integer().required(),
  thisMonth: Joi.number().integer().required(),
  today: Joi.number().integer().required()
});

app.post('/water-consumption', async (req, res) => {
  try {
    const { error } = waterConsumptionSchema.validate(req.body);
    if (error) {
      return res.status(400).json({ error: error.details[0].message });
    }

    const { total, thisMonth, today } = req.body;

    const query = `
      INSERT INTO water_consumption (total, this_month, today)
      VALUES ($1, $2, $3)
      RETURNING id, total, this_month, today
    `;

    const result = await client.query(query, [total, thisMonth, today]);

    res.status(201).json({
      message: 'Water consumption data added successfully!',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error adding water consumption data:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

  const createStackMonitoringTable = `
  CREATE TABLE IF NOT EXISTS stack_monitoring (
  id SERIAL PRIMARY KEY,
  source VARCHAR(255) NOT NULL,
  as_per_consent VARCHAR(255) NOT NULL,
  provided VARCHAR(255) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
)
`;


client.query(createStackMonitoringTable)
  .then(() => console.log('Stack Monitoring table created or already exists.'))
  .catch(err => console.error('Error creating stack monitoring table:', err));


  const stackMonitoringSchema = Joi.object({
    source: Joi.string().required(),
    asPerConsent: Joi.string().required(),
    provided: Joi.string().required()
  });

  

// Updated validation schema to match Flutter form requirements
const registerSchema = Joi.object({
  username: Joi.string().min(4).required(),
  email: Joi.string().email().pattern(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/).required(),
  password: Joi.string().min(8)
    .pattern(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/)
    .required()
    .messages({
      'string.pattern.base': 'Password must contain at least one letter and one number'
    }),
  phone: Joi.string().length(10).pattern(/^\d{10}$/).required(),
  company: Joi.string().required(),
  designation: Joi.string().required(),
});



const loginSchema = Joi.object({
  username: Joi.string().required(),
  password: Joi.string().required(),
});

const createBorewellTable = `
  CREATE TABLE IF NOT EXISTS borewell_water (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    borewell_no VARCHAR(50) NOT NULL,
    located_at VARCHAR(100) NOT NULL,
    in_kld DECIMAL(10,2) NOT NULL,
    out_kld DECIMAL(10,2) NOT NULL,
    water_consumed DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  )
`;

// Initialize table
client.query(createBorewellTable)
  .then(() => console.log('Borewell Water table created or already exists.'))
  .catch(err => console.error('Error creating borewell water table:', err));

// Validation schema
const borewellSchema = Joi.object({
  date: Joi.date().required(),
  borewell_no: Joi.string().required(),
  located_at: Joi.string().required(),
  in_kld: Joi.number().positive().required(),
  out_kld: Joi.number().positive().required(),
  water_consumed: Joi.number().required()
});

// Add Borewell Data Endpoint
app.post('/borewell', async (req, res) => {
  try {
    // Validate request body
    const { error } = borewellSchema.validate(req.body);
    if (error) {
      return res.status(400).json({
        error: error.details[0].message
      });
    }

    const { date, borewell_no, located_at, in_kld, out_kld, water_consumed } = req.body;

    // Check if entry already exists for this date and borewell
    const existingEntry = await client.query(
      'SELECT * FROM borewell_water WHERE date = $1 AND borewell_no = $2',
      [date, borewell_no]
    );

    if (existingEntry.rows.length > 0) {
      return res.status(409).json({
        error: 'An entry already exists for this date and borewell number'
      });
    }

    // Insert new entry
    const query = `
      INSERT INTO borewell_water 
      (date, borewell_no, located_at, in_kld, out_kld, water_consumed)
      VALUES (\$1, \$2, \$3, \$4, \$5, $6)
      RETURNING *
    `;

    const result = await client.query(query, [
      date,
      borewell_no,
      located_at,
      in_kld,
      out_kld,
      water_consumed
    ]);

    res.status(201).json({
      message: 'Borewell data added successfully!',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error adding borewell data:', err);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});

// Get Borewell Data Endpoint
app.get('/borewell', async (req, res) => {
  try {
    const { date, search } = req.query;
    let query = 'SELECT * FROM borewell_water';
    const values = [];
    const conditions = [];

    // Add date filter if provided
    if (date) {
      conditions.push(`date = $${values.length + 1}`);
      values.push(date);
    }

    // Add search filter if provided
    if (search) {
      conditions.push(`(
        borewell_no ILIKE $${values.length + 1} OR 
        located_at ILIKE $${values.length + 1}
      )`);
      values.push(`%${search}%`);
    }

    // Combine conditions if any
    if (conditions.length > 0) {
      query += ' WHERE ' + conditions.join(' AND ');
    }

    // Order by date in descending order
    query += ' ORDER BY date DESC, borewell_no ASC';

    const result = await client.query(query, values);

    res.status(200).json({
      message: 'Data retrieved successfully',
      data: result.rows
    });

  } catch (err) {
    console.error('Error fetching borewell data:', err);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});

// Update Borewell Data Endpoint
app.put('/borewell/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { error } = borewellSchema.validate(req.body);
    if (error) {
      return res.status(400).json({
        error: error.details[0].message
      });
    }

    const { date, borewell_no, located_at, in_kld, out_kld, water_consumed } = req.body;

    const query = `
      UPDATE borewell_water 
      SET date = $1, borewell_no = $2, located_at = $3, 
          in_kld = $4, out_kld = $5, water_consumed = $6
      WHERE id = $7
      RETURNING *
    `;

    const result = await client.query(query, [
      date,
      borewell_no,
      located_at,
      in_kld,
      out_kld,
      water_consumed,
      id
    ]);

    if (result.rows.length === 0) {
      return res.status(404).json({
        error: 'Borewell entry not found'
      });
    }

    res.status(200).json({
      message: 'Borewell data updated successfully!',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error updating borewell data:', err);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});

// Delete Borewell Data Endpoint
app.delete('/borewell/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const result = await client.query(
      'DELETE FROM borewell_water WHERE id = $1 RETURNING *',
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        error: 'Borewell entry not found'
      });
    }

    res.status(200).json({
      message: 'Borewell data deleted successfully!',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error deleting borewell data:', err);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});

// Get Borewell Statistics
app.get('/borewell/stats', async (req, res) => {
  try {
    const { start_date, end_date } = req.query;
    
    const query = `
      SELECT 
        borewell_no,
        COUNT(*) as total_entries,
        SUM(water_consumed) as total_consumption,
        AVG(water_consumed) as avg_consumption,
        MIN(water_consumed) as min_consumption,
        MAX(water_consumed) as max_consumption
      FROM borewell_water
      WHERE ($1::date IS NULL OR date >= \$1)
        AND ($2::date IS NULL OR date <= $2)
      GROUP BY borewell_no
      ORDER BY borewell_no
    `;

    const result = await client.query(query, [start_date, end_date]);

    res.status(200).json({
      message: 'Statistics retrieved successfully',
      data: result.rows
    });

  } catch (err) {
    console.error('Error fetching borewell statistics:', err);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});
// Registration endpoint with improved error handling
app.post('/register', async (req, res) => {
  try {
    // Validate request body
    const { error } = registerSchema.validate(req.body);
    if (error) {
      return res.status(400).json({ 
        error: error.details[0].message 
      });
    }

    const { username, email, password, phone, company, designation } = req.body;

    // Check if user already exists
    const existingUser = await client.query(
      'SELECT * FROM users WHERE email = $1 OR username = $2',
      [email, username]
    );

    if (existingUser.rows.length > 0) {
      return res.status(409).json({ 
        error: 'User with this email or username already exists' 
      });
    }

    // Hash password and insert user
    const hashedPassword = await bcrypt.hash(password, 10);
    const query = `
      INSERT INTO users (username, email, password, phone, company, designation)
      VALUES ($1, $2, $3, $4, $5, $6)
      RETURNING id, username, email, phone, company, designation
    `;

    const result = await client.query(query, [
      username,
      email,
      hashedPassword,
      phone,
      company,
      designation
    ]);

    res.status(201).json({
      message: 'Registration successful!',
      user: result.rows[0]
    });

  } catch (err) {
    console.error('Error during registration:', err);
    if (err.code === '23505') { // Unique violation
      return res.status(409).json({
        error: 'User with this email or username already exists'
      });
    }
    
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});

app.post('/login', async (req, res) => {
  try {
    const { error } = loginSchema.validate(req.body);
    if (error) {
      return res.status(400).json({
        error: error.details[0].message
      });
    }

    const { username, password } = req.body;

    const result = await client.query(
      'SELECT * FROM users WHERE username = $1',
      [username]
    );

    if (result.rows.length === 0) {
      return res.status(401).json({
        error: 'Invalid credentials'
      });
    }

    const user = result.rows[0];
    const validPassword = await bcrypt.compare(password, user.password);
    
    if (!validPassword) {
      return res.status(401).json({
        error: 'Invalid credentials'
      });
    }

    delete user.password;

    res.status(200).json({
      message: 'Login successful',
      user: user
    });

  } catch (err) {
    console.error('Error during login:', err);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});


app.post('/stack-monitoring', async (req, res) => {
  try {
    // Validate request body
    const { error } = stackMonitoringSchema.validate(req.body);
    if (error) {
      return res.status(400).json({ 
        error: error.details[0].message 
      });
    }

    const { source, asPerConsent, provided } = req.body;

    // Insert monitoring data
    const query = `
      INSERT INTO stack_monitoring 
      (source, as_per_consent, provided)
      VALUES ($1, $2, $3)
      RETURNING id, source, as_per_consent, provided
    `;

    const result = await client.query(query, [
      source, 
      asPerConsent, 
      provided
    ]);

    res.status(201).json({
      message: 'Monitoring data added successfully!',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error adding monitoring data:', err);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});

// Get Stack Monitoring Data Endpoint
app.get('/stack-monitoring', async (req, res) => {
  try {
    const { search } = req.query;

    let query = 'SELECT * FROM stack_monitoring';
    let params = [];

    // If search query is provided, add search condition
    if (search) {
      query += ` WHERE 
        source ILIKE $1 OR 
        as_per_consent ILIKE $1 OR 
        provided ILIKE $1`;
      params = [`%${search}%`];
    }

    const result = await client.query(query, params);

    res.status(200).json({
      message: 'Monitoring data retrieved successfully!',
      data: result.rows
    });

  } catch (err) {
    console.error('Error retrieving monitoring data:', err);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});


const createConsumptionTable = `
  CREATE TABLE IF NOT EXISTS consumption (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    source VARCHAR(255) NOT NULL,
    water_supplied VARCHAR(255),
    treated_water VARCHAR(255),
    quantity_supplied NUMERIC(10,2) NOT NULL,
    mode_of_convergence VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  )
`;

client.query(createConsumptionTable)
  .then(() => console.log('Consumption table created or already exists.'))
  .catch(err => console.error('Error creating consumption table:', err));

// Validation Schema for Consumption Entry
const consumptionSchema = Joi.object({
  date: Joi.string().pattern(/^\d{4}-\d{2}-\d{2}$/).required(),
  source: Joi.string().required(),
  waterSupplied: Joi.string().optional(),
  treatedWater: Joi.string().optional(),
  quantitySupplied: Joi.number().positive().required(),
  modeOfConvergence: Joi.string().optional()
});

// Add Consumption Data Endpoint
app.post('/consumption', async (req, res) => {
  try {
    // Validate request body
    const { error } = consumptionSchema.validate(req.body);
    if (error) {
      return res.status(400).json({ 
        error: error.details[0].message 
      });
    }

    const { 
      date, 
      source, 
      waterSupplied, 
      treatedWater, 
      quantitySupplied, 
      modeOfConvergence 
    } = req.body;

    // Insert consumption data
    const query = `
      INSERT INTO consumption (
        date, 
        source, 
        water_supplied, 
        treated_water, 
        quantity_supplied, 
        mode_of_convergence
      ) VALUES ($1, $2, $3, $4, $5, $6)
      RETURNING *
    `;

    const result = await client.query(query, [
      date, 
      source, 
      waterSupplied,
      treatedWater,
      quantitySupplied,
      modeOfConvergence
    ]);

    res.status(201).json({
      message: 'Consumption data added successfully!',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error adding consumption data:', err);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});

// Get Consumption Data Endpoint
app.get('/consumption', async (req, res) => {
  try {
    const { source, date } = req.query;

    let query = 'SELECT * FROM consumption';
    let params = [];
    let whereConditions = [];

    // Build dynamic query based on filters
    if (source) {
      whereConditions.push(`source ILIKE $${params.length + 1}`);
      params.push(`%${source}%`);
    }

    if (date) {
      whereConditions.push(`date = $${params.length + 1}`);
      params.push(date);
    }

    // Add WHERE clause if conditions exist
    if (whereConditions.length > 0) {
      query += ' WHERE ' + whereConditions.join(' AND ');
    }

    const result = await client.query(query, params);

    res.status(200).json({
      message: 'Consumption data retrieved successfully!',
      data: result.rows
    });

  } catch (err) {
    console.error('Error retrieving consumption data:', err);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});

// Endpoint to get unique sources
app.get('/consumption/sources', async (_req, res) => {
  try {
    const query = 'SELECT DISTINCT source FROM consumption ORDER BY source';
    const result = await client.query(query);

    res.status(200).json({
      message: 'Sources retrieved successfully!',
      sources: result.rows.map(row => row.source)
    });
  } catch (err) {
    console.error('Error retrieving sources:', err);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
});


// const createTankerTable = `
//   CREATE TABLE IF NOT EXISTS tanker (
//     id SERIAL PRIMARY KEY,
//     slno INTEGER NOT NULL,
//     date DATE NOT NULL,
//     tanker_no TEXT NOT NULL,
//     meter_provided TEXT NOT NULL,
//     in_kld NUMERIC(10,2) NOT NULL,
//     out_kld NUMERIC(10,2) NOT NULL,
//     water_consumed NUMERIC(10,2) NOT NULL,
//     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
//   )
// `;

// client.query(createTankerTable)
//   .then(() => console.log('Tanker table created or already exists.'))
//   .catch(err => console.error('Error creating tanker table:', err));

// // Tanker Data Validation Schema
// const tankerSchema = Joi.object({
//   date: Joi.string().pattern(/^\d{4}-\d{2}-\d{2}$/).required(),
//   tanker_no: Joi.string().required(),
//   meter_provided: Joi.string().valid('Yes', 'No').required(),
//   in: Joi.number().positive().required(),
//   out: Joi.number().positive().required(),
//   water_consumed: Joi.number().positive().required()
// });

// // POST Endpoint to Add Tanker Data
// app.post('/tanker', async (req, res) => {
//   try {
//     // Validate request body
//     const { error } = tankerSchema.validate(req.body);
//     if (error) {
//       return res.status(400).json({ 
//         error: error.details[0].message 
//       });
//     }

//     const { 
//       date, 
//       tanker_no, 
//       meter_provided, 
//       in: inKld, 
//       out: outKld, 
//       water_consumed 
//     } = req.body;

//     // Dynamically generate serial number (if not provided)
//     const slnoQuery = 'SELECT COALESCE(MAX(slno), 0) + 1 AS next_slno FROM tanker';
//     const slnoResult = await client.query(slnoQuery);
//     const slno = slnoResult.rows[0].next_slno;

//     // Insert tanker data
//     const query = `
//       INSERT INTO tanker 
//       (slno, date, tanker_no, meter_provided, in_kld, out_kld, water_consumed)
//       VALUES ($1, $2, $3, $4, $5, $6, $7)
//       RETURNING id, slno, date, tanker_no, meter_provided, in_kld, out_kld, water_consumed
//     `;

//     const result = await client.query(query, [
//       slno, 
//       date, 
//       tanker_no,
//       meter_provided,
//       inKld, 
//       outKld, 
//       water_consumed
//     ]);

//     res.status(201).json({
//       message: 'Tanker data added successfully!',
//       data: result.rows[0]
//     });

//   } catch (err) {
//     console.error('Error adding tanker data:', err);
//     res.status(500).json({
//       error: 'Internal server error'
//     });
//   }
// });

// // GET Endpoint to Retrieve Tanker Data
// app.get('/tanker', async (req, res) => {
//   try {
//     const { date, search } = req.query;

//     let query = 'SELECT * FROM tanker';
//     let params = [];
//     let whereConditions = [];

//     // Build dynamic query based on filters
//     if (date) {
//       whereConditions.push(`date = $${params.length + 1}`);
//       params.push(date);
//     }

//     if (search) {
//       // Add search condition to match against any text column
//       whereConditions.push(`(
//         CAST(slno AS TEXT) ILIKE $${params.length + 1} OR 
//         tanker_no ILIKE $${params.length + 1} OR 
//         meter_provided ILIKE $${params.length + 1} OR 
//         CAST(in_kld AS TEXT) ILIKE $${params.length + 1} OR 
//         CAST(out_kld AS TEXT) ILIKE $${params.length + 1} OR 
//         CAST(water_consumed AS TEXT) ILIKE $${params.length + 1}
//       )`);
//       params.push(`%${search}%`);
//     }

//     // Add WHERE clause if conditions exist
//     if (whereConditions.length > 0) {
//       query += ' WHERE ' + whereConditions.join(' AND ');
//     }

//     // Order by date in descending order
//     query += ' ORDER BY date DESC, slno DESC';

//     const result = await client.query(query, params);

//     res.status(200).json({
//       message: 'Tanker data retrieved successfully!',
//       data: result.rows.map(row => ({
//         slno: row.slno,
//         date: row.date,
//         tanker_no: row.tanker_no,
//         meter_provided: row.meter_provided,
//         in: row.in_kld,
//         out: row.out_kld,
//         water_consumed: row.water_consumed
//       }))
//     });

//   } catch (err) {
//     console.error('Error retrieving tanker data:', err);
//     res.status(500).json({
//       error: 'Internal server error'
//     });
//   }
// });

const createTankerTable = `
  CREATE TABLE IF NOT EXISTS tanker (
    id SERIAL PRIMARY KEY,
    slno INTEGER NOT NULL,
    date DATE NOT NULL,
    tanker_no TEXT NOT NULL,
    meter_provided TEXT NOT NULL,
    in_kld NUMERIC(10,2) NOT NULL,
    out_kld NUMERIC(10,2) NOT NULL,
    water_consumed NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  )
`;

client.query(createTankerTable)
  .then(() => console.log('Tanker table created or already exists.'))
  .catch(err => console.error('Error creating tanker table:', err));

// Add Tanker Data Endpoint
app.post('/tanker', async (req, res) => {
  try {
    const tankerSchema = Joi.object({
      slno: Joi.number().required(),
      date: Joi.date().required(),
      tanker_no: Joi.string().required(),
      meter_provided: Joi.string().required(),
      in_kld: Joi.number().required(),
      out_kld: Joi.number().required(),
      water_consumed: Joi.number().required()
    });

    const { error } = tankerSchema.validate(req.body);
    if (error) {
      return res.status(400).json({ error: error.details[0].message });
    }

    const { slno, date, tanker_no, meter_provided, in_kld, out_kld, water_consumed } = req.body;

    const query = `
      INSERT INTO tanker 
      (slno, date, tanker_no, meter_provided, in_kld, out_kld, water_consumed)
      VALUES (\$1, \$2, \$3, \$4, \$5, \$6, $7)
      RETURNING *
    `;

    const result = await client.query(query, [
      slno, date, tanker_no, meter_provided, in_kld, out_kld, water_consumed
    ]);

    res.status(201).json({
      message: 'Tanker data added successfully!',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error adding tanker data:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Get Tanker Data Endpoint
app.get('/tanker', async (req, res) => {
  try {
    const { date, search } = req.query;
    let query = 'SELECT * FROM tanker';
    let params = [];

    if (date) {
      query += ' WHERE date = $1';
      params.push(date);
    }

    if (search) {
      query += params.length ? ' AND' : ' WHERE';
      query += ` tanker_no ILIKE $${params.length + 1}`;
      params.push(`%${search}%`);
    }

    query += ' ORDER BY date DESC, slno DESC';

    const result = await client.query(query, params);
    res.status(200).json({
      message: 'Data retrieved successfully',
      data: result.rows
    });

  } catch (err) {
    console.error('Error retrieving tanker data:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

const createLabourColonyWasteTable = `
  CREATE TABLE IF NOT EXISTS labour_colony_waste (
    id SERIAL PRIMARY KEY,
    entry_no INTEGER NOT NULL,
    date DATE NOT NULL,
    quantity_kg NUMERIC(10,2) NOT NULL,
    storage_mode VARCHAR(255) NOT NULL,
    disposal_mode VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  )
`;

client.query(createLabourColonyWasteTable)
  .then(() => console.log('Labour Colony Waste table created or already exists.'))
  .catch(err => console.error('Error creating labour colony waste table:', err));

// Validation Schema
const labourColonyWasteSchema = Joi.object({
  entry_no: Joi.number().integer().required(),
  date: Joi.date().required(),
  quantity_kg: Joi.number().positive().required(),
  storage_mode: Joi.string().required(),
  disposal_mode: Joi.string().required()
});

// GET Labour Colony Waste Data Endpoint
app.get('/labour-colony-waste', async (req, res) => {
  try {
    const { date, search } = req.query;
    let query = 'SELECT * FROM labour_colony_waste';
    const values = [];
    const conditions = [];

    // Add date filter if provided
    if (date) {
      conditions.push(`date = ${values.length + 1}`);
      values.push(date);
    }

    // Add search filter if provided
    if (search) {
      conditions.push(`(
        CAST(entry_no AS TEXT) ILIKE ${values.length + 1} OR 
        storage_mode ILIKE ${values.length + 1} OR 
        disposal_mode ILIKE ${values.length + 1}
      )`);
      values.push(`%${search}%`);
    }

    // Combine conditions if any
    if (conditions.length > 0) {
      query += ' WHERE ' + conditions.join(' AND ');
    }

    // Order by date in descending order, then by entry number
    query += ' ORDER BY date DESC, entry_no DESC';

    const result = await client.query(query, values);

    res.status(200).json({
      message: 'Labour Colony Waste data retrieved successfully!',
      data: result.rows
    });

  } catch (err) {
    console.error('Error retrieving Labour Colony Waste data:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// POST Labour Colony Waste Data Endpoint
app.post('/labour-colony-waste', async (req, res) => {
  try {
    // Validate request body
    const { error } = labourColonyWasteSchema.validate(req.body);
    if (error) {
      return res.status(400).json({ 
        error: error.details[0].message 
      });
    }

    const { entry_no, date, quantity_kg, storage_mode, disposal_mode } = req.body;

    // Check for duplicate entry
    const duplicateCheck = await client.query(
      'SELECT * FROM labour_colony_waste WHERE entry_no = $1 AND date = $2',
      [entry_no, date]
    );

    if (duplicateCheck.rows.length > 0) {
      return res.status(409).json({
        error: 'An entry with this number already exists for the given date'
      });
    }

    // Insert new waste data
    const query = `
      INSERT INTO labour_colony_waste 
      (entry_no, date, quantity_kg, storage_mode, disposal_mode)
      VALUES (\$1, \$2, \$3, \$4, $5)
      RETURNING *
    `;

    const result = await client.query(query, [
      entry_no, 
      date, 
      quantity_kg, 
      storage_mode, 
      disposal_mode
    ]);

    res.status(201).json({
      message: 'Labour Colony Waste data added successfully!',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error adding Labour Colony Waste data:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// UPDATE Labour Colony Waste Data Endpoint
app.put('/labour-colony-waste/:id', async (req, res) => {
  try {
    const { id } = req.params;

    // Validate request body
    const { error } = labourColonyWasteSchema.validate(req.body);
    if (error) {
      return res.status(400).json({ 
        error: error.details[0].message 
      });
    }

    const { entry_no, date, quantity_kg, storage_mode, disposal_mode } = req.body;

    // Update waste data
    const query = `
      UPDATE labour_colony_waste 
      SET entry_no = $1, 
          date = $2, 
          quantity_kg = $3, 
          storage_mode = $4, 
          disposal_mode = $5
      WHERE id = $6
      RETURNING *
    `;

    const result = await client.query(query, [
      entry_no, 
      date, 
      quantity_kg, 
      storage_mode, 
      disposal_mode, 
      id
    ]);

    if (result.rows.length === 0) {
      return res.status(404).json({
        error: 'Labour Colony Waste entry not found'
      });
    }

    res.status(200).json({
      message: 'Labour Colony Waste data updated successfully!',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error updating Labour Colony Waste data:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// DELETE Labour Colony Waste Data Endpoint
app.delete('/labour-colony-waste/:id', async (req, res) => {
  try {
    const { id } = req.params;

    const result = await client.query(
      'DELETE FROM labour_colony_waste WHERE id = $1 RETURNING *',
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        error: 'Labour Colony Waste entry not found'
      });
    }

    res.status(200).json({
      message: 'Labour Colony Waste data deleted successfully!',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error deleting Labour Colony Waste data:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});
const createCDWasteTable = `
  CREATE TABLE IF NOT EXISTS cd_waste (
    id SERIAL PRIMARY KEY,
    project_area NUMERIC(10,2) NOT NULL,
    waste_amount NUMERIC(10,2) NOT NULL,
    date DATE NOT NULL,
    waste_type VARCHAR(100),
    disposal_method VARCHAR(100),
    reuse_recycling_details TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  )
`;

client.query(createCDWasteTable)
  .then(() => console.log('C&D Waste table created or already exists.'))
  .catch(err => console.error('Error creating C&D waste table:', err));

// Validation Schema
const cdWasteSchema = Joi.object({
  project_area: Joi.number().positive().required(),
  waste_amount: Joi.number().positive(),
  date: Joi.date().required(),
  waste_type: Joi.string(),
  disposal_method: Joi.string(),
  reuse_recycling_details: Joi.string()
});

// GET C&D Waste Data
app.get('/cd-waste', async (req, res) => {
  try {
    const { startDate, endDate, search } = req.query;
    let query = 'SELECT * FROM cd_waste';
    const params = [];
    const conditions = [];

    if (startDate) {
      conditions.push(`date >= $${params.length + 1}`);
      params.push(startDate);
    }

    if (endDate) {
      conditions.push(`date <= $${params.length + 1}`);
      params.push(endDate);
    }

    if (search) {
      conditions.push(`
        waste_type ILIKE $${params.length + 1} OR 
        disposal_method ILIKE $${params.length + 1}
      `);
      params.push(`%${search}%`);
    }

    if (conditions.length > 0) {
      query += ' WHERE ' + conditions.join(' AND ');
    }

    query += ' ORDER BY date DESC';

    const result = await client.query(query, params);

    res.status(200).json({
      message: 'Data retrieved successfully',
      data: result.rows
    });

  } catch (err) {
    console.error('Error retrieving C&D waste data:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// POST C&D Waste Data
app.post('/cd-waste', async (req, res) => {
  try {
    const { error } = cdWasteSchema.validate(req.body);
    if (error) {
      return res.status(400).json({ error: error.details[0].message });
    }

    const {
      project_area,
      date,
      waste_type,
      disposal_method,
      reuse_recycling_details
    } = req.body;

    // Calculate waste amount based on project area
    // This is a simplified calculation - adjust according to your specific requirements
    const waste_amount = project_area * 0.15; // Example: 150kg of waste per square meter

    const query = `
      INSERT INTO cd_waste 
      (project_area, waste_amount, date, waste_type, disposal_method, reuse_recycling_details)
      VALUES (\$1, \$2, \$3, \$4, \$5, $6)
      RETURNING *
    `;

    const result = await client.query(query, [
      project_area,
      waste_amount,
      date,
      waste_type,
      disposal_method,
      reuse_recycling_details
    ]);

    res.status(201).json({
      message: 'C&D Waste data added successfully',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error adding C&D waste data:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Calculate Waste Endpoint
app.post('/cd-waste/calculate', async (req, res) => {
  try {
    const { project_area, startDate, endDate } = req.body;

    if (!project_area || project_area <= 0) {
      return res.status(400).json({ error: 'Invalid project area' });
    }

    // Calculate estimated waste
    const waste_amount = await calculateWasteAmount(project_area);

    // Store calculation in database
    const query = `
      INSERT INTO cd_waste (project_area, waste_amount, date)
      VALUES (\$1, \$2, $3)
      RETURNING *
    `;

    const result = await client.query(query, [
      project_area,
      waste_amount,
      new Date()
    ]);

    res.status(200).json({
      message: 'Waste calculation completed',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error calculating waste:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Get Waste Statistics
app.get('/cd-waste/statistics', async (req, res) => {
  try {
    const { startDate, endDate } = req.query;
    
    const query = `
      SELECT 
        DATE_TRUNC('month', date) as month,
        SUM(waste_amount) as total_waste,
        AVG(waste_amount) as avg_waste,
        COUNT(*) as total_entries
      FROM cd_waste
      WHERE ($1::date IS NULL OR date >= \$1)
        AND ($2::date IS NULL OR date <= $2)
      GROUP BY DATE_TRUNC('month', date)
      ORDER BY month DESC
    `;

    const result = await client.query(query, [startDate, endDate]);

    res.status(200).json({
      message: 'Statistics retrieved successfully',
      data: result.rows
    });

  } catch (err) {
    console.error('Error retrieving statistics:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Helper function to calculate waste amount
async function calculateWasteAmount(projectArea) {
  // This is a simplified calculation
  // You can implement more complex calculations based on your requirements
  const baseWasteRate = 0.15; // 150kg per square meter
  const wasteFactor = 1.2; // Additional factor for variables

  return projectArea * baseWasteRate * wasteFactor;
}

// Update C&D Waste Data
app.put('/cd-waste/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { error } = cdWasteSchema.validate(req.body);
    
    if (error) {
      return res.status(400).json({ error: error.details[0].message });
    }

    const {
      project_area,
      waste_amount,
      date,
      waste_type,
      disposal_method,
      reuse_recycling_details
    } = req.body;

    const query = `
      UPDATE cd_waste 
      SET project_area = $1,
          waste_amount = $2,
          date = $3,
          waste_type = $4,
          disposal_method = $5,
          reuse_recycling_details = $6
      WHERE id = $7
      RETURNING *
    `;

    const result = await client.query(query, [
      project_area,
      waste_amount,
      date,
      waste_type,
      disposal_method,
      reuse_recycling_details,
      id
    ]);

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Record not found' });
    }

    res.status(200).json({
      message: 'C&D Waste data updated successfully',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error updating C&D waste data:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Delete C&D Waste Data
app.delete('/cd-waste/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    const result = await client.query(
      'DELETE FROM cd_waste WHERE id = $1 RETURNING *',
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Record not found' });
    }

    res.status(200).json({
      message: 'C&D Waste data deleted successfully',
      data: result.rows[0]
    });

  } catch (err) {
    console.error('Error deleting C&D waste data:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.post('/add-waste', async (req, res) => {
  try {
    const { date, project_area, waste_estimation } = req.body;

    const result = await client.query(
      'INSERT INTO cd_waste (date, project_area, waste_estimation) VALUES (\$1, \$2, $3) RETURNING *',
      [date, project_area, waste_estimation]
    );

    res.status(201).json({
      message: 'Waste data added successfully',
      data: result.rows[0],
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to add waste data' });
  }
});

app.get('/get-waste', async (req, res) => {
  try {
    const { start_date, end_date } = req.query;

    const result = await client.query(
      'SELECT * FROM cd_waste WHERE date BETWEEN \$1 AND $2 ORDER BY date DESC',
      [start_date, end_date]
    );

    res.status(200).json({
      message: 'Waste data retrieved successfully',
      data: result.rows,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to retrieve waste data' });
  }
});

app.get('/health', (_req, res) => {
  res.status(200).json({ status: 'ok' });
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});