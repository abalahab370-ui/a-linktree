Program XOX;
Type 
    tab = array [1..3 , 1..3 ] Of string;
Procedure tableValue(Var T:tab);
Var 
    i,j : integer;
Begin
    For i:=1 To 3 Do
        Begin
            For j:=1 To 3 Do
                T[i,j] := '--';
        End;
    For i:=1 To 3 Do
        Begin
            For j:=1 To 3 Do
                write(T[i,j]:6);
            writeln;
            writeln;
        End;
End;
Procedure newtable( T:tab);
Var 
    i,j : integer;
Begin
    For i:=1 To 3 Do
        Begin
            For j:=1 To 3 Do
                write(T[i,j]:6);
            writeln;
            writeln;
        End;
End;
Function chakeX(T:tab) : boolean;
Var 
    i,j : integer;
    win : boolean;
Begin
    win := true;
    For i:=1 To 3 Do
        Begin
            For j:=1 To 3 Do
                Begin
                    If T[i,j]<>'X' Then
                        win := false;
                End;
            If win=true Then
                Begin
                    chakeX := win;
                    exit;
                End;
        End;
    For i:=1 To 3 Do
        Begin
            For j:=1 To 3 Do
                Begin
                    If T[j,i]<>'X' Then
                        win := false;
                End;
            Begin
                chakeX := win;
                exit;
            End;
        End;
    If (T[1,1]<>'X') And (T[2,2]<>'X') And (T[3,3]<>'X') Then
        Begin
            win := false;
        End
    Else
        If (T[1,1]='X') And (T[2,2]='X') And (T[3,3]='X') Then
            Begin
                win := true;
                chakeX := win;
                exit;
            End;
    If (T[3,1]<>'X') And (T[2,2]<>'X') And (T[1,3]<>'X') Then
        Begin
            win := false;
        End
    Else
        If (T[3,1]='X') And (T[2,2]='X') And (T[1,3]='X') Then
            Begin
                win := true;
                chakeX := win;
                exit;
            End;
End;
Function chakeO(T:tab) : boolean;
Var 
    i,j : integer;
    win : boolean;
Begin
    win := true;
    For i:=1 To 3 Do
        Begin
            For j:=1 To 3 Do
                Begin
                    If T[i,j]<>'O' Then
                        win := false;
                End;
            If win=true Then
                Begin
                    chakeO := win;
                    exit;
                End;
        End;
    For i:=1 To 3 Do
        Begin
            For j:=1 To 3 Do
                Begin
                    If T[j,i]<>'O' Then
                        win := false;
                End;
            Begin
                chakeO := win;
                exit;
            End;
        End;
    If (T[1,1]<>'O') And (T[2,2]<>'O') And (T[3,3]<>'O') Then
        Begin
            win := false;
        End
    Else
        If (T[1,1]='O') And (T[2,2]='O') And (T[3,3]='O') Then
            Begin
                win := true;
                chakeO := win;
                exit;
            End;
    If (T[3,1]<>'O') And (T[2,2]<>'O') And (T[1,3]<>'O') Then
        Begin
            win := false;
        End
    Else
        If (T[3,1]='O') And (T[2,2]='O') And (T[1,3]='O') Then
            Begin
                win := true;
                chakeO := win;
                exit;
            End;
End;
Var 
    T : tab;
    i,a,b,j : integer;
    V : boolean;
Begin
    writeln('--------WELLCOM TO X O GAME--------');
    writeln;
    tableValue(T);
    writeln;
    writeln('PLAYER 1 : -----------------> X');
    writeln('PLAYER 1 : -----------------> O');
    repeat
        Repeat
            Repeat
                i:=1;
                writeln('PLAYER ',i, ' ENTER THE LIGN AND THE COULLONE TO ENTER YOUR CHOISE :');
                writeln;
                writeln('LING :');
                readln(a);
                writeln;
                writeln('COULONE :');
                readln(b);
            Until (a In [1..3]) And (b In [1..3]) And (T[a,b] = '--');
            If (T[a,b] = '--') And( i=1) Then
                T[a,b] := 'X';
            newtable(T);
            V := chakeX(T);
            If V= true Then
            begin
                writeln('PLAYER 1 IS THE WINNER ');
                exit;
            end;
       until true ;   
      repeat
          repeat
                i:=2;
                writeln('PLAYER ',i, ' ENTER THE LIGN AND THE COULLONE TO ENTER YOUR CHOISE :');
                writeln;
                writeln('LING :');
                readln(a);
                writeln;
                writeln('COULONE :');
                readln(b);
          until (a In [1..3]) And (b In [1..3]) And (T[a,b] = '--');
            If (T[a,b] = '--' )And (i=2) Then
                T[a,b] := 'O';
            newtable(T);    
            V := chakeO(T);
            If V= true Then
            begin
                writeln('PLAYER 2 IS THE WINNER ');
                exit;
            end
       until true;
    Until FALSE;
End.