program matematica_atestat;

uses graph, crt, dos, venbuton, mouse2,bmp;

type butoane=array[0..100] of button;

var gd, gm, n, p, i,cod:integer;
    b:butoane;
    sem,sem0,exit:boolean;
    Afis,S:string;
    numar:real;

procedure initializare(i:integer);
  begin
       gd:=detect;
       initgraph(gd,gm,'');
       setbkcolor(i);

  end;

procedure select;
  var i,cod,xi,yi:integer; s:string;
  begin
       setlinestyle(solidln,0,thickwidth);
       line(0,240,getmaxx,240);
       xi:=8; yi:=248;
       {Taste numerice}
       {----------------------------- Coloana 1}
       for i:=7 to 9 do
           begin
                str(i,s);
                definire_buton(b[i],xi,yi,xi+50,yi+50,7,14,s);
                pune_buton(b[i]);
                xi:=xi+58;
           end;
       yi:=yi+58; xi:=8;
       for i:=4 to 6 do
           begin
                str(i,s);
                definire_buton(b[i],xi,yi,xi+50,yi+50,7,14,s);
                pune_buton(b[i]);
                xi:=xi+58;
           end;
       yi:=yi+58; xi:=8;
       for i:=1 to 3 do
           begin
                str(i,s);
                definire_buton(b[i],xi,yi,xi+50,yi+50,7,14,s);
                pune_buton(b[i]);
                xi:=xi+58;
           end;
       definire_buton(b[0],8,422,58,472,7,14,'0');
       pune_buton(b[0]);
       definire_buton(b[35],66,422,116,472,8,15,'-');
       pune_buton(b[35]);
       definire_buton(b[33],124,422,174,472,8,15,'.');
       pune_buton(b[33]);
       setcolor(15);
       setlinestyle(solidln,0,thickwidth);
       line(182,240,182,getmaxy);
       xi:=190;
       {Operatii simple}
       {------------------------------- Coloana 2}
       definire_buton(b[10],xi,248,xi+50,298,8,14,'/');
       pune_buton(b[10]);
       definire_buton(b[11],xi,306,xi+50,356,8,14,'x');
       pune_buton(b[11]);
       definire_buton(b[12],xi,364,xi+50,414,8,14,'-');
       pune_buton(b[12]);
       definire_buton(b[13],xi,422,xi+50,472,8,14,'+');
       pune_buton(b[13]);
       setcolor(15);
       setlinestyle(solidln,0,thickwidth);
       line(248,240,248,getmaxy);
       xi:=256; yi:=248;
       {Operatii avansate}
       {------------------------------- Coloana 3.1}
       definire_buton(b[14],xi,yi,xi+50,yi+50,7,4,chr(251));
       pune_buton(b[14]);
       definire_buton(b[15],xi,yi+58,xi+50,yi+108,7,4,'ln x');
       pune_buton(b[15]);
       definire_buton(b[16],xi,yi+116,xi+50,yi+166,7,4,'x'+chr(253));
       pune_buton(b[16]);
       definire_buton(b[17],xi,yi+174,xi+50,yi+224,7,4,chr(179)+'x'+chr(179));
       pune_buton(b[17]);
       xi:=xi+58;
       {------------------------------ Coloana 3.2}
       definire_buton(b[18],xi,yi,xi+50,yi+50,7,4,'sin');
       pune_buton(b[18]);
       definire_buton(b[19],xi,yi+58,xi+50,yi+108,7,4,'cos');
       pune_buton(b[19]);
       definire_buton(b[20],xi,yi+116,xi+50,yi+166,7,4,'tan');
       pune_buton(b[20]);
       definire_buton(b[21],xi,yi+174,xi+50,yi+224,7,4,'cot');
       pune_buton(b[21]);
       xi:=xi+58;
       {----------------------------- Coloana 3.3}
       definire_buton(b[22],xi,yi,xi+50,yi+50,7,4,'arcsin');
       pune_buton(b[22]);
       definire_buton(b[23],xi,yi+58,xi+50,yi+108,7,4,'arccos');
       pune_buton(b[23]);
       definire_buton(b[24],xi,yi+116,xi+50,yi+166,7,4,'arctan');
       pune_buton(b[24]);
       definire_buton(b[25],xi,yi+174,xi+50,yi+224,7,4,'arccot');
       pune_buton(b[25]);
       xi:=xi+58;
       {------------------------------ Coloana 3.4}
       definire_buton(b[26],xi,yi,xi+50,yi+50,7,4,chr(227));
       pune_buton(b[26]);
       definire_buton(b[27],xi,yi+58,xi+50,yi+108,7,4,'e'+chr(252));
       pune_buton(b[27]);
       definire_buton(b[28],xi,yi+116,xi+50,yi+166,7,4,'x!');
       pune_buton(b[28]);
       definire_buton(b[29],xi,yi+174,xi+50,yi+224,7,4,'%');
       pune_buton(b[29]);
       xi:=xi+58;
       {------------------------------}
       setcolor(15);
       line(xi,240,xi,getmaxy);
       line(xi,240,xi,200);
       outtextxy(xi+50,220,'Comenzi');
       xi:=xi+10;
       {Coloana 4 - Comenzi}
       definire_buton(b[30],xi,yi,xi+130,yi+50,9,15,'=');
       pune_buton(b[30]);
       definire_buton(b[31],xi,yi+58,xi+130,yi+108,5,15,'STERGERE');
       pune_buton(b[31]);
       definire_buton(b[32],xi,yi+116,xi+130,yi+166,2,15,'RESET');
       pune_buton(b[32]);
       definire_buton(b[34],xi,yi+174,xi+130,yi+224,4,15,'INCHIDERE');
       pune_buton(b[34]);

       {------------------------------}
       setcolor(15);
       line(0,200,getmaxx,200);
       line(182,200,182,240);
       line(0,getmaxy,getmaxx,getmaxy);
       line(0,getmaxy,0,200);
       line(getmaxx,getmaxy,getmaxx,200);
       outtextxy(20,220,'Introducere numar');
       outtextxy(260,220,'Operatii matematice');
       {--------------------------------}
       {Rezolvare}
       setfillstyle(solidfill,7);
       setlinestyle(solidln,0,ThickWidth);
       bar(0,180,getmaxx,100);
    {   bar(480,190,getmaxx,60);   }
       line(0,180,getmaxx,180);
       line(0,180,0,100);
       line(getmaxx,100,getmaxx,180);
       line(0,100,getmaxx,100);

       {------------------------- culori}
       xi:=16; yi:=10;
       definire_buton(b[41],xi,yi,xi+88,yi+30,8,15,'NEGRU');
       pune_buton(b[41]);
       xi:=xi+16+88;
       definire_buton(b[42],xi,yi,xi+88,yi+30,1,15,'ALBASTRU');
       pune_buton(b[42]);
       xi:=xi+16+88;
       definire_buton(b[43],xi,yi,xi+88,yi+30,2,15,'VERDE');
       pune_buton(b[43]);
       xi:=xi+16+88;
       definire_buton(b[44],xi,yi,xi+88,yi+30,3,15,'CYAN');
       pune_buton(b[44]);
       xi:=xi+16+88;
       definire_buton(b[45],xi,yi,xi+88,yi+30,6,15,'MARO');
       pune_buton(b[45]);
       xi:=xi+16+88;
       definire_buton(b[46],xi,yi,xi+88,yi+30,9,15,'BLEU');
       pune_buton(b[46]);
       {---------------------------------------------------}


  end;

procedure sterg;
  begin
       setcolor(15);
       setfillstyle(solidfill,7);
       setlinestyle(solidln,0,ThickWidth);
       bar(0,180,getmaxx,100);
    {   bar(480,190,getmaxx,60);   }
       line(0,180,getmaxx,180);
       line(0,180,0,100);
       line(getmaxx,100,getmaxx,180);
       line(0,100,getmaxx,100);
  end;


procedure radical;
var numar:real; cod:integer;
  begin
                           begin
                                val(Afis,numar,cod);
                                If numar>=0 then
                                   begin
                                        numar:=sqrt(numar);
                                        str(numar:15:5,Afis);
                                   end
                                else Afis:='EROARE! Numarul introdus este negativ.';
                                sterg;

                           end;

 end;

procedure logaritm;
var numar:real; cod:integer;
  begin
                           begin
                                val(Afis,numar,cod);
                                If numar>0 then
                                   begin
                                        numar:=ln(numar);
                                        str(numar:15:5,Afis);
                                   end
                                else
                                    If numar<0 then
                                    Afis:='EROARE! Numarul introdus este negativ.'
                                    else Afis:='EROARE! Ln(0) nu este definit.';
                                sterg;

                           end;

 end;

procedure patrat;
var numar:real; cod:integer;
  begin
                           begin
                                val(Afis,numar,cod);
                                numar:=sqr(numar);
                                str(numar:15:5,Afis);
                                sterg;
                           end;

 end;

procedure modul;
var numar:real; cod:integer;
  begin
                           begin
                                val(Afis,numar,cod);
                                if numar<0 then numar:= -1 * numar;
                                str(numar:15:5,Afis);
                                sterg;

                           end;

 end;

procedure sinus;
var numar:real; cod:integer;
  begin
                           begin
                                val(Afis,numar,cod);
                                numar:=sin(numar);
                                str(numar:1:5,Afis);
                                sterg;

                           end;

 end;

procedure cosinus;
var numar:real; cod:integer;
  begin
                           begin
                                val(Afis,numar,cod);
                                numar:=cos(numar);
                                str(numar:1:5,Afis);
                                sterg;

                           end;

 end;

procedure tangenta;
var numar:real;
  begin
                           begin
                                val(Afis,numar,cod);
                                if cos(numar)<>0 then
                                   begin
                                        numar:=sin(numar)/cos(numar);
                                        str(numar:1:5,Afis);
                                   end
                                else Afis:='EROARE! Tangenta nu este definita in aceasta valoare.';
                                sterg;
                           end;

 end;

procedure cotangenta;
var numar:real;
  begin
                           begin
                                val(Afis,numar,cod);
                                if sin(numar)<>0 then
                                   begin
                                        numar:=cos(numar)/sin(numar);
                                        str(numar:1:5,Afis);
                                   end
                                else Afis:='EROARE! Cotangenta nu este definita in aceasta valoare.';
                                sterg;

                           end;

 end;

procedure arcsin;
var numar,x:real;
  begin
                           begin
                                val(Afis,numar,cod);
                                if numar=1 then
                                   begin
                                           numar:=pi/2;
                                           str(numar:2:5,Afis);
                                   end;
                                if numar=-1 then
                                   begin
                                           numar:= -pi/2;
                                           str(numar:2:5,Afis);
                                   end;
                                if (numar<-1) or (numar>1) then
                                   Afis:='EROARE! Numarul introdus trebuie sa apartina intervalului [-1,1]. ';
                                if (numar<1) and (numar>-1) then
                                   begin
                                        if numar<0 then
                                           begin
                                                numar:=-numar;
                                                x:=numar/sqrt(1-sqr(numar));
                                                numar:=-ArcTan(x);
                                           end
                                        else
                                            numar:=ArcTan(numar/sqrt(1-sqr(numar)));
                                        str(numar:2:5,Afis);
                                   end;
                                sterg;
                           end;

 end;

procedure arccos;
var numar,x:real; cod:integer;
  begin
                           begin
                                val(Afis,numar,cod);
                              {  ArcCos(x) = ArcTan (sqrt (1-sqr (x)) /x)}
                              {x:=sqrt(1-sqr(numar))/numar;}
                              if (numar<-1) or (numar>1) then
                                 Afis:='EROARE! Numarul introdus trebuie sa apartina intervalului [-1,1]. ';
                              if numar=0 then
                                 begin
                                      numar:=pi/2;
                                      str(numar:2:5,Afis);
                                 end;
                              if numar=1 then
                                 begin
                                      numar:=0;
                                      str(numar:1:0,Afis);
                                 end;
                              if numar=-1 then
                                 begin
                                      numar:=pi;
                                      str(numar:1:5,Afis);
                                 end;
                              If (numar<1) and (numar>-1) then
                                 begin
                                      If numar<0 then
                                         begin
                                              numar:=-numar;
                                              x:=sqrt (1-sqr (numar)) /numar;
                                              numar:= pi - arctan(x);
                                          end
                                      else
                                          begin
                                               x:=sqrt (1-sqr (numar)) /numar;
                                               numar:=arctan(x);
                                          end;
                                      str(numar:2:5,Afis);
                                 end;
                                sterg;
                           end;

 end;

procedure arctg;
var numar,x:real; cod:integer;
  begin
                           begin
                                val(Afis,numar,cod);
                                x:=arctan(numar);
                                str(x:2:5,Afis);
                                sterg;
                           end;

 end;

procedure arccot;
var numar:real; cod:integer;
  begin
                           begin
                                val(Afis,numar,cod);
                                if numar<>0 then
                                   begin
                                        if numar>0 then
                                           numar:=arctan(1/numar)
                                        else
                                            begin
                                                 numar:=-numar;
                                                 numar:=pi-arctan(1/numar);
                                            end;
                                        str(numar:2:5,Afis);
                                   end;
                                if numar=0 then
                                   begin
                                       numar:=pi/2;
                                       str(numar:2:5,Afis);
                                   end;
                                sterg;
                           end;

 end;

procedure exponentiala;
var numar:real; cod:integer; x:integer;
  begin
       val(Afis,numar,cod);
       x:=trunc(numar);
       numar:=exp(numar);
       str(numar:15:5,Afis);
       sterg;
 end;

procedure factorial;
var numar:real; i,cod:integer; x:longint;
  begin
                           begin
                                val(Afis,numar,cod);
                                If (numar<0) or (numar<>trunc(numar)) then
                                   Afis:='EROARE! Numarul introdus trebuie sa fie natural.'
                                else
                                  begin
                                       x:=trunc(numar);

                                       if x=0 then numar:=1
                                          else
                                              begin
                                                   numar:=1;
                                                   for i:=1 to x do
                                                       numar:=numar*i;
                                              end;
                                       {x:=trunc(numar);}
                                       str(numar:15:0,Afis);
                                  end;
                                sterg;
                           end;

 end;

procedure procent;
var numar:real; cod:integer;
  begin
                           begin
                                val(Afis,numar,cod);
                                numar:=numar/100;
                                str(numar:10:5,Afis);
                                sterg;
                           end;

 end;

procedure culori;
begin
              if buton_apasat(b[41]) then setbkcolor(0);
              if buton_apasat(b[42]) then setbkcolor(1);
              if buton_apasat(b[43]) then setbkcolor(2);
              if buton_apasat(b[44]) then setbkcolor(3);
              if buton_apasat(b[45]) then setbkcolor(6);
              if buton_apasat(b[46]) then setbkcolor(9);
end;

procedure citire;
var sem1:boolean;
begin
     delay(50);
     sem1:=false;
     if Afis='0' then
        begin
             if buton_apasat(b[33]) then
                begin
                     Afis:=Afis+'.';
                     sem1:=true;
                     for i:=0 to 9 do
                         if buton_apasat(b[i]) then
                            begin
                                 str(i,S);
                                 Afis:=Afis+S;
                            end;
                end;
             If sem1=false then
                     for i:=0 to 9 do
                         if buton_apasat(b[i]) then
                             begin
                                 sterg;
                                 str(i,Afis);
                             end;
        end;
     if (buton_apasat(b[33])) and (pos('.',Afis)=0) then Afis:=Afis+'.';
     for i:=0 to 9 do
                     if buton_apasat(b[i]) then
                        begin
                             str(i,S);
                             Afis:=Afis+S;
                        end;
end;

procedure iesire;
begin
              if buton_apasat(b[34]) then
                begin
                 exit:=true;
                 halt;
                end;
end;

procedure functii;
begin
{--------------------------------------}
              {Implementare functii}
              {TRIGONOMETRIE}
              if buton_apasat(b[18]) then sinus;
              if buton_apasat(b[19]) then cosinus;
              if buton_apasat(b[20]) then tangenta;
              if buton_apasat(b[21]) then cotangenta;
              if buton_apasat(b[22]) then arcsin;
              if buton_apasat(b[23]) then arccos;
              if buton_apasat(b[24]) then arctg;
              if buton_apasat(b[25]) then arccot;
              if buton_apasat(b[26]) then   {PI}
                 begin
                      str(pi:2:5,S);
                      Afis:=S;
                      sterg;
                 end;
              {-------------------------------------}
              {ALGEBRA}
              if buton_apasat(b[17]) then modul;
              if buton_apasat(b[16]) then patrat;
              if buton_apasat(b[15]) then logaritm;
              if buton_apasat(b[14]) then radical;
              if buton_apasat(b[27]) then exponentiala;
              if buton_apasat(b[28]) then factorial;
              if buton_apasat(b[29]) then procent;
              {--------------------------------------}
end;

procedure stergere;
begin
              if buton_apasat(b[31]) and (Afis<>'') then
                 begin
                   delete(Afis,length(Afis),1);
                   mouseoff;
                   sterg;
                   outtextxy(10,140,Afis);
                   mouseon;
                 end;
end;

procedure semn;
begin
              If buton_apasat(b[35]) then
                 begin
                      val(Afis,numar,cod);
                      numar:=-numar;
                      str(numar,Afis);
                      mouseoff;
                      sterg;
                      outtextxy(10,140,Afis);
                      mouseon;
                 end;
end;

procedure adunare;
var suma,suma0,numar:real; cod:integer;
 begin
                           begin
                                sem:=true; suma:=0;
                                val(Afis,numar,cod);
                                suma:=suma+numar;
                                Afis:='';
                                sterg;
                                repeat
                                      delay(5);
                                      citire;
                                      if buton_apasat(b[26]) then
                                         begin
                                              str(pi:1:5,S);
                                              Afis:=S;
                                         end;
                                      stergere;
                                      culori;
                                      functii;
                                      iesire;
                                      mouseoff;
                                      outtextxy(10,140,Afis);
                                      mouseon;
                                until buton_apasat(b[30]);
                                val(Afis,numar,cod);
                                suma:=suma+numar;
                                str(suma:15:5,Afis);
                                sterg;
                  end;

 end;

procedure diferenta;
var suma,suma0,numar:real; cod:integer;
 begin
                           begin
                                sem:=true; suma:=0;
                                val(Afis,numar,cod);
                                suma:=suma+numar;
                                Afis:='';
                                sterg;
                                repeat
                                      citire;
                                      if buton_apasat(b[26]) then
                                         begin
                                              str(pi:1:5,S);
                                              Afis:=S;
                                         end;
                                      stergere;
                                      iesire;
                                      culori;
                                      functii;
                                      mouseoff;
                                      outtextxy(10,140,Afis);
                                      mouseon;
                                until buton_apasat(b[30]);
                                val(Afis,numar,cod);
                                suma:=suma-numar;
                                str(suma:15:5,Afis);
                                sterg;
                   end;
 end;

procedure inmultire;
var suma,numar:real; sem,sem0:boolean; cod:integer;
 begin
                           begin
                                sem:=true; suma:=1;
                                val(Afis,numar,cod);
                                suma:=suma*numar;
                                Afis:='';
                                sterg;
                                if sem0=false then
                                begin
                                repeat
                                      citire;
                                      if buton_apasat(b[26]) then
                                         begin
                                              str(pi:1:5,S);
                                              Afis:=S;
                                         end;
                                      stergere;
                                      iesire;
                                      culori;
                                      functii;
                                      mouseoff;
                                      outtextxy(10,140,Afis);
                                      mouseon;
                                until buton_apasat(b[30]);
                                val(Afis,numar,cod);
                                suma:=suma*numar;
                                end
                                else suma:=0;
                                str(suma:15:5,Afis);
                                sterg;
                   end;
 end;

procedure impartire;
var suma,numar,p:real; sem,sem0:boolean; cod:integer;
 begin
                       begin                                                                                begin
                                sem:=true; suma:=1;
                                val(Afis,numar,cod);
                                suma:=suma*numar;
                                Afis:='';
                                sterg;
                                if numar<>0 then
                                begin
                                repeat
                                      citire;
                                      if buton_apasat(b[26]) then
                                         begin
                                              str(pi:1:5,S);
                                              Afis:=S;
                                         end;
                                      stergere;
                                      iesire;
                                      culori;
                                      functii;
                                      mouseoff;
                                      outtextxy(10,140,Afis);
                                      mouseon;
                                until buton_apasat(b[30]);
                                val(Afis,numar,cod);
                                p:=suma/numar;
                                str(p:15:5,Afis);
                                end
                                else Afis:='Eroare! Un numar nu se poate imparti la 0.';
                                sterg;
                   end;

 end;
end;

procedure calcul;
var suma,numar:longint;
    sem,sem0:boolean;
    cod,i:integer;
    p:real;

   begin
        {Introducere numar}
        Afis:='0';
        numar:=0;
        sem:=false; sem0:=true; exit:=false;
        repeat
              delay(50);
              citire;
              culori;

              {SCHIMBARE SEMN}
              semn;
              {----------------------------------------}
              {STERGERE}
              stergere;
              {--------------------------------------}
              {IESIRE}
              iesire;
              {--------------------------------------}
              {RESET}
              if buton_apasat(b[32]) then
                 begin
                      sterg;
                      calcul;
                 end;
              {-------------------------------------}
              {Multimea de functii}
              functii;
              {OPERATII ELEMENTARE}
              if buton_apasat(b[13]) then adunare;
              if buton_apasat(b[12]) then diferenta;
              if buton_apasat(b[11]) then inmultire;
              if buton_apasat(b[10]) then impartire;
              {---------------------------------------}
              {PUNCT ZECIMAL}
              if (buton_apasat(b[33])) and (pos('.',Afis)=0) then
                 begin
                    Afis:=Afis+'.';
                 end;
              {---------------------------------------}
              {EGAL}
              if buton_apasat(b[30]) then sem:=true;
              mouseoff;
              outtextxy(10,140,Afis);
              mouseon;

        until exit;
end;



begin{pp}

     initializare(6);
     cleardevice;
     delay(50);
     select;
     mouseon;
     calcul;
     culori;
     readkey;
     mouseoff;
end.