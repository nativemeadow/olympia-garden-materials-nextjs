#!/usr/bin/node

const fs = require('fs');
const path = require('path');
const { promisify } = require('util');
const mysql = require('mysql2/promise');

const readdir = promisify(fs.readdir);

async function main() {
    console.log('Starting...');
    const connection = await mysql.createConnection({
        host: 'localhost',
        user: 'jmcclint',
        password: 'cheetha!',
        database: 'olympia_garden_materials'
    });

    const files = await readdir(path.join(__dirname, 'public', 'images', 'products'));

    console.log(files);

    for (const file of files) {
        const [name, extension] = file.split('.');
        if (extension === 'jpg' || extension === 'png') { // adjust as needed
            const [rows, fields] = await connection.execute(
                'INSERT INTO media (UUID, type, image, comment, created_at, updated_at) VALUES (UUID(), ?, ?, ?, NOW(), NOW())',
                ['image', file, 'initial image'] // adjust as needed
            );
        }
    }

    await connection.end();
}

main().catch(console.error);