import express from 'express'
import cors from 'cors'
import helmet from 'helmet'
import { json } from 'body-parser'
import dotenv from 'dotenv'

dotenv.config()

const port = process.env.PORT || 4000

const app = express()

app.use(cors())
app.use(helmet())
app.use(json())

app.get('/ping', (req, res) => {
    res.status(200).json({message: 'Pong'})
})


app.listen(port, () => console.log(`Running in *:${port}`))
