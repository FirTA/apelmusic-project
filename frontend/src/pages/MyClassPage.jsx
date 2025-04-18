import React from "react";

import {
    Container, Typography, List, ListItem, Divider, Box
} from "@mui/material";
import SetContextHeader from "../components/SetContextHeader";
import kelas from "./Kelas.png";

// Data dummy percobaan 
const data = [
    {
        kategori: 'Drum',
        judul_kelas: 'Kursus Drummer Special Coach (Eno Netral)',
        Jadwal: 'Senin, 25 Juli 2022',
        harga: '4.500.000',
    },
    {
        kategori: 'Fundamental Drum',
        judul_kelas: 'Fundamental Alat Musik Drum Bersama Lorem Ipsum',
        Jadwal: 'Senin, 25 Juli 2022',
        harga: '1.000.000',
    },
    {
        kategori: 'Pemula',
        judul_kelas: 'Kursus Membentuk Suara Drum dengan Benar untuk Pemula Bla Bla Bla',
        Jadwal: 'Senin, 25 Juli 2022',
        harga: '500.000',
    },
    {
        kategori: 'Intermediate',
        judul_kelas: 'Memainkan Alat Musik dengan Level Intermediate',
        Jadwal: 'Senin, 25 Juli 2022',
        harga: '4.500.000',
    },
];

function MyClassPage() {
    return (
        <>
            <SetContextHeader />
            <Container maxWidth="lg">
                <Typography variant="p" component="h2" mt={4} mb={3}>My Class</Typography>
                <List>
                    {data.map((value, index) => {
                        return (
                            <>
                                <ListItem
                                    key={index}
                                    disablePadding
                                >
                                    <Box
                                        component="img"
                                        sx={{
                                            height: 233,
                                            width: 350,
                                            maxHeight: { xs: 223, md: 167 },
                                            maxWidth: { xs: 350, md: 250 }
                                        }}
                                        alt={value.judul_kelas}
                                        src={kelas}
                                    />
                                    <Box component="div" ml={2} sx={{ flexGrow: 1 }}>
                                        <Typography variant="span" component="span" mb={1} sx={{ color: 'grey' }}>{value.kategori}</Typography>
                                        <Typography variant="h6" component="h6" sx={{ fontWeight: 'bolder' }}>{value.judul_kelas}</Typography>
                                        <Typography variant="p" component="p" mb={2}>Jadwal: {value.Jadwal}</Typography>
                                        <Typography variant="p" component="p" sx={{ color: '#5D5FEF', fontWeight: 'bolder' }}>IDR {value.harga}</Typography>
                                    </Box>
                                </ListItem>
                                <Divider sx={{ marginBottom: "1.5rem", marginTop: "1.5rem" }} />
                            </>
                        );
                    })}
                </List>
            </Container>
        </>
    );
}

export default MyClassPage;