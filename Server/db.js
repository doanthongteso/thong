// import pg from "pg";

// const pool = new pg.Pool({
//   user: "postgres",
//   password: "doanTHONG2001@",
//   host: "db.mtvsnlhhcbpsbrxfkbcc.supabase.co",
//   database: "postgres",
//   port: 5432,
// });

// export default pool;
import { Sequelize } from "sequelize";
const sequelize = new Sequelize('postgres://postgres:doanTHONG2001@@db.mtvsnlhhcbpsbrxfkbcc.supabase.co:5432/postgres')
sequelize.authenticate().then(() => {
    console.log('Connection has been established successfully.');
  })
  .catch(err => {
    console.error('Unable to connect to the database:', err);

  });
  export default sequelize;