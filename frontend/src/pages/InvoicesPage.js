import React from "react";

import {
    Container, Typography, Button,
    Table, TableBody, TableCell, TableHead, TableContainer, TableRow
} 
from "@mui/material";
import SetContextHeader from "../components/SetContextHeader";

const rowsData = [
    {
        no_invoice: 'APM0001',
        tanggal_beli: '12 Juli 2022',
        jumlah_kursus: '2',
        total_harga: '11.500.000',
    },
    {
        no_invoice: 'APM0002',
        tanggal_beli: '05 Februari 2022',
        jumlah_kursus: '1',
        total_harga: '4.000.000',
    },
    {
        no_invoice: 'APM0003',
        tanggal_beli: '30 Agustus 2021',
        jumlah_kursus: '1',
        total_harga: '2.400.000',
    },
];

function InvoicesPage() {
    return (
        <>
            <SetContextHeader />
            <Container maxWidth="lg">
                <Typography variant="p" component="h2" mt={4} mb={3}>Menu Invoice</Typography>

                {/* Menampilkan tabel invoices */}
                <TableContainer>
                    <Table sx={{ minWidth: 650 }} aria-label="Tabel Invoices">
                        <TableHead sx={{ backgroundColor: "#F2C94C" }}>
                            <TableRow>
                                <TableCell align="center">No</TableCell>
                                <TableCell align="center">No. Invoice</TableCell>
                                <TableCell align="center">Tanggal Beli</TableCell>
                                <TableCell align="center">Jumlah Kursus</TableCell>
                                <TableCell align="center">Total Harga</TableCell>
                                <TableCell align="center">Action</TableCell>
                            </TableRow>
                        </TableHead>
                        <TableBody>
                            {/* Display all rows data */}
                            {
                                rowsData.map((data, index) => (
                                    <TableRow>
                                        <TableCell align="center">{index + 1}</TableCell>
                                        <TableCell align="center">{data.no_invoice}</TableCell>
                                        <TableCell align="center">{data.tanggal_beli}</TableCell>
                                        <TableCell align="center">{data.jumlah_kursus}</TableCell>
                                        <TableCell align="center">IDR {data.total_harga}</TableCell>
                                        <TableCell align="center">
                                            <Button variant="contained" sx={{ backgroundColor: '#5D5FEF' }}>Rincian</Button>
                                        </TableCell>
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

export default InvoicesPage;