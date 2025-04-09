import React from "react";

import {
    Container, Typography, Button, Box,
    Table, TableBody, TableCell, TableHead, TableContainer, TableRow
}
    from "@mui/material";
import SetContextHeader from "../components/SetContextHeader";

const rowsData = [
    {
        nama_course: 'Kursus Drummer Special Coach(Eno Netral)',
        kategori: 'Drum',
        jadwal: 'Senin, 25 Juli 2022',
        harga: '8.500.000',
    },
    {
        nama_course: 'Biola Mid-Level Course',
        kategori: 'Biola',
        jadwal: 'Sabtu, 23 Juli 2022',
        harga: '3.000.000',
    },
];

function InvoiceDetailPage() {
    return (
        <>
            <SetContextHeader />
            <Container maxWidth="lg">
                {/* Detail invoice informasi */}
                <Typography variant="p" component="h2" mt={4} mb={3}>Rincian Invoice</Typography>
                <Typography variant="p" component="p" mb={2}>No. Invoice: APM0001</Typography>
                <Box sx={{ display: 'flex', justifyContent: 'space-between' }} mb={4}>
                    <Typography variant="p" component="p">Tanggal Beli: 12 Juli 2022</Typography>
                    <Typography variant="p" component="p" sx={{ fontWeight: 'bolder' }}>Total Harga  IDR 11.500.000</Typography>
                </Box>

                {/* Menampilkan data kelas yang dibeli */}
                <TableContainer>
                    <Table sx={{ minWidth: 650 }} aria-label="Tabel Invoices">
                        <TableHead sx={{ backgroundColor: "#F2C94C" }}>
                            <TableRow>
                                <TableCell align="center">No</TableCell>
                                <TableCell align="center">Nama Course</TableCell>
                                <TableCell align="center">Kategori</TableCell>
                                <TableCell align="center">Jadwal</TableCell>
                                <TableCell align="center">Harga</TableCell>
                            </TableRow>
                        </TableHead>
                        <TableBody>
                            {/* Display all rows data */}
                            {
                                rowsData.map((data, index) => (
                                    <TableRow>
                                        <TableCell align="center">{index + 1}</TableCell>
                                        <TableCell align="center">{data.nama_course}</TableCell>
                                        <TableCell align="center">{data.kategori}</TableCell>
                                        <TableCell align="center">{data.jadwal}</TableCell>
                                        <TableCell align="center">IDR {data.harga}</TableCell>
                                    </TableRow>
                                ))
                            }
                        </TableBody>
                    </Table>
                </TableContainer>
            </Container>
        </>
    );
}

export default InvoiceDetailPage;