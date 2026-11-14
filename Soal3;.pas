program Soal3;
uses crt;

type
    TMataKuliah = record
        nama: string;
        sks: integer;
        nilai: string;
        skor: real;
    end;

    TMahasiswa = record
        nama: string;
        nim: string;
        jumlahMK: integer;
        matkul: array of TMataKuliah;
        totalSKS: integer;
        totalSkor: real;
    end;

var
    mhs: array of TMahasiswa;
    i, j, n: integer;
    bobot: real;

begin
    clrscr;

    write('Jumlah mahasiswa: ');
    readln(n);

    SetLength(mhs, n);

    // Bagian input data mahasiswa
    for i := 0 to n - 1 do
    begin
        writeln;
        writeln('=== DATA MAHASISWA ', i + 1, ' ===');

        with mhs[i] do
        begin
            write('Nama: ');
            readln(nama);

            write('NIM: ');
            readln(nim);

            write('Jumlah mata kuliah: ');
            readln(jumlahMK);

        SetLength(matkul, jumlahMK);

        totalSKS := 0;
        totalSkor := 0;

        // Bagian input data mata kuliah
        for j := 0 to jumlahMK - 1 do
        begin
            writeln;
            writeln('Mata Kuliah ', j + 1);

        with matkul[j] do
        begin
            write('Nama mata kuliah: ');
            readln(nama);

            write('Jumlah SKS: ');
            readln(sks);

            repeat
            write('Nilai (A, B+, B, C+, C, D, E): ');
            readln(nilai);

            case nilai of
                'A'  : bobot := 4;
                'B+' : bobot := 3.5;
                'B'  : bobot := 3;
                'C+' : bobot := 2.5;
                'C'  : bobot := 2;
                'D'  : bobot := 1;
                'E'  : bobot := 0;
            else
                bobot := -1;
            end;

            if bobot = -1 then
                writeln('Nilai tidak valid!');

            until bobot <> -1;

          skor := sks * bobot;
        end;

        totalSKS := totalSKS + matkul[j].sks;
        totalSkor := totalSkor + matkul[j].skor;
        end;
    end;
end;

    // Nampilin data mahasiswa
    for i := 0 to n - 1 do
    begin
        clrscr;

        with mhs[i] do
        begin
            writeln('Nama : ', nama);
            writeln('NIM  : ', nim);

            writeln('-------------------------------------------------------');
            writeln('-------------------------------------------------------');
            writeln('| No | Mata Kuliah       | SKS | Nilai | Skor |');
            writeln('-------------------------------------------------------');

        for j := 0 to jumlahMK - 1 do
        begin
            with matkul[j] do
            begin
                writeln('| ', (j + 1):2,
                ' | ', nama:17, // Biar muat di kotak bang.. hehe
                ' | ', sks:3,
                ' | ', nilai:5,
                ' | ', skor:4:1, ' |');
            end;
        end;

        writeln('-------------------------------------------------------');
        writeln('Total SKS  : ', totalSKS);
        writeln('Total Skor : ', totalSkor:0:1);

        if totalSKS > 0 then
            writeln('IP         : ',
            (totalSkor / totalSKS):0:2)
        else
            writeln('IP         : 0.00');
        end;
    end;
end.