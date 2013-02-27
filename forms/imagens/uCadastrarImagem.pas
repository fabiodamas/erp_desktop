// -------------------------------------------------------------------------- \\
// Rotina de Seleção de Imagem Retirada do Link:                              \\
// http://www.delphipages.com/forum/showthread.php?t=103326                   \\
// Martin Dimitrov                                                            \\
// -------------------------------------------------------------------------- \\

unit uCadastrarImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, ExtCtrls, StdCtrls, Mask, ToolEdit, ComCtrls, Math,
  Buttons, jpeg, Menus;

type
  TfmCadastrarImagem = class(TfmFormBaseAvancado)
    tcbZoom: TTrackBar;
    edtDiretorioFotos: TDirectoryEdit;
    pnlTumbs: TPanel;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    img10: TImage;
    img16: TImage;
    img17: TImage;
    img18: TImage;
    img19: TImage;
    img20: TImage;
    img11: TImage;
    img12: TImage;
    img13: TImage;
    img14: TImage;
    img15: TImage;
    Label1: TLabel;
    edtPagIni: TEdit;
    edtPagFinal: TEdit;
    Label2: TLabel;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    imgSelecao: TImage;
    btnRetornar: TBitBtn;
    Label3: TLabel;
    pnlVisualizar: TPanel;
    imgVisualizar: TImage;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    btnVisualizar: TBitBtn;
    btnFechar: TBitBtn;
    btnImagemOriginal: TBitBtn;
    lblNomeImg1: TLabel;
    lblNomeImg2: TLabel;
    lblNomeImg3: TLabel;
    lblNomeImg4: TLabel;
    lblNomeImg5: TLabel;
    lblNomeImg6: TLabel;
    lblNomeImg7: TLabel;
    lblNomeImg8: TLabel;
    lblNomeImg9: TLabel;
    lblNomeImg10: TLabel;
    lblNomeImg11: TLabel;
    lblNomeImg12: TLabel;
    lblNomeImg13: TLabel;
    lblNomeImg14: TLabel;
    lblNomeImg15: TLabel;
    lblNomeImg16: TLabel;
    lblNomeImg17: TLabel;
    lblNomeImg18: TLabel;
    lblNomeImg19: TLabel;
    lblNomeImg20: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tcbZoomChange(Sender: TObject);
    procedure img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure imgSelecaoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgSelecaoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSelecaoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtDiretorioFotosChange(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImagemOriginalClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtDiretorioFotosExit(Sender: TObject);
  private
    FAlturaDefault: Integer;
    FLarguraDefault: Integer;
    X1, Y1, X2, Y2: Integer;
    procedure CortarImagem(fSource: TGraphic; fDest: TBitmap; fWidth, fHeight: Integer; fLeft, fTop: Integer; fImageDest: TImage);
    procedure SelecaoFotos(Sender: TObject);
    procedure AlterarImagem(Sender: TObject);
    procedure CarregarDiretorio(pPath: string; pCapacidade: Integer; pPontoInicio: Integer);
    procedure MostrarThumbs;
    procedure RemoveTheRect;
    function NormalizeRect(R: TRect): TRect;
    procedure RestrictCursorToDrawingArea(const Image: TImage);
    procedure DrawTheRect;
    procedure RemoveCursorRestrictions;
  public
    FStreamFoto: TStream;
  end;

var
  fmCadastrarImagem: TfmCadastrarImagem;
  Counter: Byte;
  CounterStart: Byte;
  Looper: LongInt;

implementation

uses uFormBaseConfig, uMenu, uFuncoes;

{$R *.dfm}

procedure MovingDots(X, Y: Integer; TheCanvas: TCanvas); stdcall;
begin
  Inc(Looper);
{$R-}
  Counter := Counter shl 1; // Shift the bit left one
{$R+}
  if Counter = 0 then
    Counter := 1; // If it shifts off left, reset it
  if (Counter and 224) > 0 {// Are any of the left 3 bits set?} then
    TheCanvas.Pixels[X, Y] := clWhite // Erase the pixel
  else
    TheCanvas.Pixels[X, Y] := clBlack; // Draw the pixel
end;

procedure TfmCadastrarImagem.CortarImagem(fSource: TGraphic; fDest: TBitmap; fWidth, fHeight: Integer; fLeft, fTop: Integer; fImageDest: TImage);
var
  vRect: TRect;
  PanelDC: HDC;
begin
  fDest.Width := fWidth;
  fDest.Height := fHeight;

  vRect := Rect(fLeft, fTop, fDest.Width, fDest.Height);

  fImageDest.Picture.Graphic := nil;
  fImageDest.Picture.Bitmap.Height := fHeight - 1;
  fImageDest.Picture.Bitmap.Width := fWidth - 1;

  PanelDC := GetDC(Handle);

  try
    BitBlt(fImageDest.Picture.Bitmap.Canvas.Handle, 0, 0,
      fWidth, fHeight, PanelDC, X1 + 1, Y1 + 1, SRCCOPY);
  finally
    ReleaseDC(Handle, PanelDC);
  end;

  fDest.Canvas.StretchDraw(vRect, fSource);
end;

function TfmCadastrarImagem.NormalizeRect(R: TRect): TRect;
begin
  // This routine normalizes a rectangle. It makes sure that the Left,Top
  // coords are always above and to the left of the Bottom,Right coords.
  with R do
  begin
    if Left > Right then
      if Top > Bottom then
        Result := Rect(Right, Bottom, Left, Top)
      else
        Result := Rect(Right, Top, Left, Bottom)
    else if Top > Bottom then
      Result := Rect(Left, Bottom, Right, Top)
    else
      Result := Rect(Left, Top, Right, Bottom);
  end
end;

procedure TfmCadastrarImagem.RestrictCursorToDrawingArea(const Image: TImage);
var
  CursorClipArea: TRect;
begin
  CursorClipArea := Bounds(Image.ClientOrigin.X, Image.ClientOrigin.Y,
    Image.Width, Image.Height);
  Windows.ClipCursor(@CursorClipArea);
end;

procedure TfmCadastrarImagem.RemoveCursorRestrictions;
begin
  Windows.ClipCursor(nil)
end;

procedure TfmCadastrarImagem.FormCreate(Sender: TObject);
begin
  try
    inherited;
    SetFormStyle(fsNormal);
    FAlturaDefault := 0;
    FLarguraDefault := 0;
    edtDiretorioFotos.Text := LoadConfigPathImage(GetPathProfileUser);
  except
  
  end;
end;

procedure TfmCadastrarImagem.tcbZoomChange(Sender: TObject);
begin
  imgSelecao.Width := Floor((FLarguraDefault * tcbZoom.Position) / 100);
  imgSelecao.Height := Floor((FAlturaDefault * tcbZoom.Position) / 100);
end;

procedure TfmCadastrarImagem.img1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  SelecaoFotos(Sender);
end;

procedure TfmCadastrarImagem.SelecaoFotos(Sender: TObject);
var
  vCnt: Integer;
const
  cAltura = 84;
  cLargura = 129;
begin
  for vCnt := 1 to 20 do
  begin
    if (Sender as TImage).Name = TImage(FindComponent('img' + IntToStr(vCnt))).Name then
    begin
      if (Sender as TImage).Height<>(cAltura + 10) then
      begin
        (Sender as TImage).BringToFront;
      end;
      (Sender as TImage).Height := cAltura + 10;
      (Sender as TImage).Width := cLargura + 10;
    end
    else
    begin
      if TImage(FindComponent('img' + IntToStr(vCnt))).Height <> cAltura then
      begin
        TImage(FindComponent('img' + IntToStr(vCnt))).SendToBack;
      end;
      TImage(FindComponent('img' + IntToStr(vCnt))).Height := cAltura;
      TImage(FindComponent('img' + IntToStr(vCnt))).Width := cLargura;
    end;
  end;
end;

procedure TfmCadastrarImagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  fmCadastrarImagem := nil;
end;

procedure TfmCadastrarImagem.AlterarImagem(Sender: TObject);
begin
  imgSelecao.Picture := (Sender as TImage).Picture;
  FAlturaDefault := imgSelecao.Height;
  FLarguraDefault := imgSelecao.Width;
  tcbZoom.Position := 70;
  pnlTumbs.Visible := not pnlTumbs.Visible;
  imgSelecao.Visible := True;
  tcbZoom.Enabled := True;
end;

procedure TfmCadastrarImagem.img1Click(Sender: TObject);
begin
  AlterarImagem(Sender);
end;

procedure TfmCadastrarImagem.CarregarDiretorio(pPath: string;
  pCapacidade: Integer; pPontoInicio: Integer);
var
  vSR: TSearchRec;
  vAtt, vCnt, vQtdImgs, vQtdPgns, vPontoInicio, vImgLoad, vAux: Integer;
  vPath: string;
begin
  vAtt := 0;
  vQtdImgs := 0;
  vAtt := vAtt + faAnyFile;
  vPath := pPath;
  vPontoInicio := pPontoInicio;

  if Copy(vPath, Length(vPath) - 1, 1) <> '\' then
  begin
    vPath := vPath + '\';
  end;

  for vCnt := 1 to pCapacidade do
  begin
    TImage(FindComponent('img' + IntToStr(vCnt))).Picture := nil;
  end;

  Application.ProcessMessages;

  if FindFirst(vPath + '*.*', vAtt, vSR) = 0 then
  begin
    repeat
      //if (vSR.Attr and vAtt) = vSR.Attr then begin    // * algumas imagens não carregam, por falta de atributos *
      if LowerCase(Copy(vSR.Name, Length(vSR.Name) - 3, 4)) = '.jpg' then
      begin
        vQtdImgs := vQtdImgs + 1;
      end;
      //end;
    until FindNext(vSR) <> 0;

    FindClose(vSR);
  end;

  if vQtdImgs > 0 then
  begin

    vQtdPgns := Floor(vQtdImgs / pCapacidade);

    if Frac(vQtdImgs / pCapacidade) > 0 then
    begin
      vQtdPgns := vQtdPgns + 1;
    end;

    edtPagFinal.Text := IntToStr(vQtdPgns);

    // 1 * 20 = 20
    // 2 * 20 = 40
    // 3 * 20 = 60       pPag * pCapacidade = pPagFinal

    // 1        =   1
    // 1  + 20  =  21    pPagIni = 1
    // 21 + 20  =  41    if pPagIni <> 1 then Inc(pPagIni, 20)
    // 41 + 20  =  61

    vAux := 1;

    if vPontoInicio > 1 then
    begin
      for vCnt := 2 to vPontoInicio do
      begin
        Inc(vAux, 20);
      end;
    end;

    for vCnt := 1 to 20 do
    begin
      TLabel(FindComponent('lblNomeImg' + IntToStr(vCnt))).Visible := False;
    end;

    if FindFirst(vPath + '*.*', vAtt, vSR) = 0 then
    begin
      vImgLoad := 0;
      vCnt := 0;
      repeat
        //if (vSR.Attr and vAtt) = vSR.Attr then begin // * algumas imagens não carregam, por falta de atributos *
        if LowerCase(Copy(vSR.Name, Length(vSR.Name) - 3, 4)) = '.jpg' then
        begin
          vCnt := vCnt + 1;
          //ShowMessage(IntToStr(vCnt)+' <= '+IntToStr(pPontoInicio * pCapacidade)+' and '+IntToSTr(vCnt)+' >= '+ IntToStr(vAux));
          if (vCnt<=(pPontoInicio * pCapacidade)) and (vCnt >= vAux) then
          begin
            vImgLoad := vImgLoad + 1;
            TLabel(FindComponent('lblNomeImg' + IntToStr(vImgLoad))).Visible := True;
            TLabel(FindComponent('lblNomeImg' + IntToStr(vImgLoad))).Caption := vSR.Name;
            TImage(FindComponent('img' + IntToStr(vImgLoad))).Picture.LoadFromFile(vPath + vSR.Name);
            TLabel(FindComponent('lblNomeImg' + IntToStr(vImgLoad))).BringToFront;
            Application.ProcessMessages;
            if vImgLoad = pCapacidade then
              break;
          end;
        end;
        //end;
      until FindNext(vSR) <> 0;

      FindClose(vSR);
    end;
  end;
end;

procedure TfmCadastrarImagem.MostrarThumbs;
begin
  imgSelecao.Visible := False;
  pnlTumbs.Top := 8;
  pnlTumbs.Left := 8;
  pnlTumbs.Visible := not pnlTumbs.Visible;
  pnlTumbs.BringToFront;
end;

procedure TfmCadastrarImagem.FormShow(Sender: TObject);
var
  vCnt: integer;
begin
  try
    inherited;
    fmMenu.pubTransImg := nil;
    imgSelecao.Visible := False;
    for vCnt := 1 to 20 do
    begin
      TLabel(FindComponent('lblNomeImg' + IntToStr(vCnt))).Visible := False;
    end;
    Application.ProcessMessages;
    edtDiretorioFotosChange(Self);
    pnlVisualizar.Visible := False;
  except

  end;
end;

procedure TfmCadastrarImagem.btnAnteriorClick(Sender: TObject);
var
  vInt: Integer;
begin
  if Trim(edtPagIni.Text) <> '' then
  begin
    vInt := StrToInt(edtPagIni.Text);
    Dec(vInt);
    if vInt > 0 then
    begin
      edtPagIni.Text := IntToStr(vInt);
      CarregarDiretorio(edtDiretorioFotos.Text, 20, vInt);
    end;
  end;
end;

procedure TfmCadastrarImagem.btnProximoClick(Sender: TObject);
var
  vInt: Integer;
begin
  if Trim(edtPagIni.Text) <> '' then
  begin
    vInt := StrToInt(edtPagIni.Text);
    Inc(vInt);
    if vInt <= StrToInt(edtPagFinal.Text) then
    begin
      edtPagIni.Text := IntToStr(vInt);
      CarregarDiretorio(edtDiretorioFotos.Text, 20, vInt);
    end;
  end;
end;

procedure TfmCadastrarImagem.imgSelecaoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
  begin
    X := X + (Sender as TImage).Left;
    Y := Y + (Sender as TImage).Top;
    RemoveTheRect; // Erase any existing rectangle
    X2 := X;
    Y2 := Y; // Save the new corner where the mouse is
    DrawTheRect; // Draw the Rect now... don't wait for the timer!
  end;
end;

procedure TfmCadastrarImagem.RemoveTheRect;
var
  R: TRect;
begin
  R := NormalizeRect(Rect(X1, Y1, X2, Y2)); // Rectangle might be flipped
  InflateRect(R, 1, 1); // Make the rectangle 1 pixel larger
  InvalidateRect(Handle, @R, True); // Mark the area as invalid
  InflateRect(R, -2, -2); // Now shrink the rectangle 2 pixels
  ValidateRect(Handle, @R); // And validate this new rectangle.
  // This leaves a 2 pixel band all the way around
  // the rectangle that will be erased & redrawn
  UpdateWindow(Handle);
end;

procedure TfmCadastrarImagem.DrawTheRect;
begin
  // Determines starting pixel color of Rect
  Counter := CounterStart;
  // Use LineDDA to draw each of the 4 edges of the rectangle
  LineDDA(X1, Y1, X2, Y1, @MovingDots, LongInt(Canvas));
  LineDDA(X2, Y1, X2, Y2, @MovingDots, LongInt(Canvas));
  LineDDA(X2, Y2, X1, Y2, @MovingDots, LongInt(Canvas));
  LineDDA(X1, Y2, X1, Y1, @MovingDots, LongInt(Canvas));
end;

procedure TfmCadastrarImagem.imgSelecaoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  X := X + (Sender as TImage).Left;
  Y := Y + (Sender as TImage).Top;

  RemoveTheRect; // Erase any existing rectangle
  X1 := X;
  Y1 := Y;

  X2 := X;
  Y2 := Y;

  // Force mouse movement to stay within TImage
  RestrictCursorToDrawingArea((Sender as TImage));
end;

procedure TfmCadastrarImagem.imgSelecaoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  RemoveCursorRestrictions;
end;

procedure TfmCadastrarImagem.edtDiretorioFotosChange(Sender: TObject);
begin
  if DirectoryExists(edtDiretorioFotos.Text) then
  begin
    CarregarDiretorio(edtDiretorioFotos.Text, 20, 1);
  end;
end;

procedure TfmCadastrarImagem.btnVisualizarClick(Sender: TObject);
var
  vBmpDst: TBitmap;
begin
  // Verifica se há uma imagem carregada
  if Assigned(imgSelecao.Picture.Graphic) then
  begin
    // Cria bitmap destino a ser utilizado na gravação
    vBmpDst := TBitmap.Create;
    try
      CortarImagem(imgSelecao.Picture.Graphic, vBmpDst, X2 - X1, Y2 - Y1, Y1, Y1, imgVisualizar);
      pnlVisualizar.Left := Floor(Width / 2) - Floor(pnlVisualizar.Width / 2);
      pnlVisualizar.Top := Floor(Height / 2) - Floor(pnlVisualizar.Height / 2);
      pnlVisualizar.Visible := True;
      pnlVisualizar.BringToFront;
    finally
      vBmpDst.Free;
    end;
  end;
end;

procedure TfmCadastrarImagem.btnRetornarClick(Sender: TObject);
begin
  if imgSelecao.Visible then
  begin
    imgVisualizar.Picture := nil;
    MostrarThumbs;
    tcbZoom.Enabled := False;
  end;
end;

procedure TfmCadastrarImagem.btnOKClick(Sender: TObject);
begin
  if imgVisualizar.Picture.Graphic <> nil then
  begin
    fmMenu.pubTransImg := imgVisualizar.Picture.Graphic;
    Close;
  end
  else
  begin
    ShowMessage('Nenhuma Imagem Selecionada');
  end;
end;

procedure TfmCadastrarImagem.btnCancelarClick(Sender: TObject);
begin
  pnlVisualizar.Visible := False;
end;

procedure TfmCadastrarImagem.btnImagemOriginalClick(Sender: TObject);
begin
  if imgSelecao.Picture.Graphic <> nil then
  begin
    fmMenu.pubTransImg := imgSelecao.Picture.Graphic;
    Close;
  end
  else
  begin
    ShowMessage('Nenhuma Imagem Selecionada');
  end;
end;

procedure TfmCadastrarImagem.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadastrarImagem.edtDiretorioFotosExit(Sender: TObject);
begin
  if DirectoryExists(edtDiretorioFotos.Text) then
  begin
    SaveConfigPathImage(edtDiretorioFotos.Text, GetPathProfileUser);
  end;
end;

end.

