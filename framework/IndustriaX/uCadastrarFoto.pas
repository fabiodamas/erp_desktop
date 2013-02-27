unit uCadastrarFoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, ExtCtrls, StdCtrls, Mask, ToolEdit, ComCtrls, Math,
  Buttons;

type
  TfmCadastrarFoto = class(TfmFormBaseAvancado)
    tcb_zoom: TTrackBar;
    pnl_imagem: TPanel;
    img_imagem: TImage;
    edt_diretorio_fotos: TDirectoryEdit;
    pnl_tumbs: TPanel;
    img_1: TImage;
    img_2: TImage;
    img_3: TImage;
    img_4: TImage;
    img_5: TImage;
    img_6: TImage;
    img_7: TImage;
    img_8: TImage;
    img_9: TImage;
    img_10: TImage;
    img_16: TImage;
    img_17: TImage;
    img_18: TImage;
    img_19: TImage;
    img_20: TImage;
    img_11: TImage;
    img_12: TImage;
    img_13: TImage;
    img_14: TImage;
    img_15: TImage;
    btn_diretorio: TButton;
    Label1: TLabel;
    edt_pag_ini: TEdit;
    edt_pag_final: TEdit;
    Label2: TLabel;
    btn_confirmar: TButton;
    btn_anterior: TBitBtn;
    btn_proximo: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure tcb_zoomChange(Sender: TObject);
    procedure btn_diretorioClick(Sender: TObject);
    procedure img_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img_1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_confirmarClick(Sender: TObject);
    procedure btn_anteriorClick(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
  private
    FAlturaDefault: Integer;
    FLarguraDefault: Integer;
    procedure SelecaoFotos(Sender: TObject);
    procedure AlterarImagem(Sender: TObject);
    procedure CarregarDiretorio(pPath: string; pCapacidade: Integer; pPontoInicio: Integer);
    procedure MostrarThumbs;
//    function GerarImagem : TStream;
  public
    FStreamFoto: TStream;
  end;

var
  fmCadastrarFoto: TfmCadastrarFoto;

implementation

uses uFormBaseConfig, uMenu, uFuncoes;

{$R *.dfm}

procedure TfmCadastrarFoto.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsNormal);
end;

procedure TfmCadastrarFoto.tcb_zoomChange(Sender: TObject);
begin
   img_imagem.Width:=Floor((FLarguraDefault * tcb_zoom.Position) / 100);
   img_imagem.Height:=Floor((FAlturaDefault * tcb_zoom.Position) / 100);
end;

procedure TfmCadastrarFoto.btn_diretorioClick(Sender: TObject);
begin
   if btn_diretorio.Caption = 'Carregar Diretório' then begin
      if Trim(edt_diretorio_fotos.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento do Diretório');
         edt_diretorio_fotos.SetFocus;
         exit;
      end;
      if not DirectoryExists(edt_diretorio_fotos.Text) then begin
         ShowMessage('Diretório Inválido');
         edt_diretorio_fotos.SetFocus;
         exit;
      end;
      CarregarDiretorio(edt_diretorio_fotos.Text, 20, 1);
   end; 
   if btn_diretorio.Caption = 'Retornar' then begin 
      btn_diretorio.Caption:='Carregar Diretório';
      MostrarThumbs;
      tcb_zoom.Enabled:=False;
   end;
end;

procedure TfmCadastrarFoto.img_1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   SelecaoFotos(Sender);
end;

procedure TfmCadastrarFoto.SelecaoFotos(Sender: TObject);
var vCnt : Integer;
const cAltura = 84;
      cLargura = 129;
begin
   for vCnt:=1 to 20 do begin
      if (Sender as TImage).Name = TImage(FindComponent('img_'+IntToStr(vCnt))).Name then begin
         if (Sender as TImage).Height <> (cAltura + 10) then begin
            (Sender as TImage).BringToFront;
         end;
         (Sender as TImage).Height := cAltura + 10;
         (Sender as TImage).Width  := cLargura + 10;
       end
      else begin
         if TImage(FindComponent('img_'+IntToStr(vCnt))).Height <> cAltura then begin
            TImage(FindComponent('img_'+IntToStr(vCnt))).SendToBack;
         end;
         TImage(FindComponent('img_'+IntToStr(vCnt))).Height:=cAltura;
         TImage(FindComponent('img_'+IntToStr(vCnt))).Width:=cLargura;
      end;
   end;
end;

procedure TfmCadastrarFoto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   fmCadastrarFoto:=nil;
end;

procedure TfmCadastrarFoto.AlterarImagem(Sender: TObject);
begin
   img_imagem.Picture:=(Sender as TImage).Picture;
   FAlturaDefault:=img_imagem.Height;
   FLarguraDefault:=img_imagem.Width;
   tcb_zoom.Position:=70;

   pnl_tumbs.Visible:=not pnl_tumbs.Visible;

   pnl_imagem.Top:=8;
   pnl_imagem.Left:=8;
   pnl_imagem.Visible:=not pnl_imagem.Visible;
   pnl_imagem.BringToFront;

   tcb_zoom.Enabled:=True; 
   btn_diretorio.Caption:='Retornar';
end;

procedure TfmCadastrarFoto.img_1Click(Sender: TObject);
begin
   AlterarImagem(Sender);
end;

procedure TfmCadastrarFoto.CarregarDiretorio(pPath: string;
  pCapacidade: Integer; pPontoInicio: Integer);
var vSR : TSearchRec;
    vAtt, vCnt, vQtdImgs, vQtdPgns, vPontoInicio, vImgLoad, vAux : Integer;
    vPath : string;
begin
   vAtt:=0;
   vQtdImgs:=0;
   vAtt:=vAtt + faAnyFile;
   vPath:=pPath;
   vPontoInicio:=pPontoInicio;

   if Copy(vPath, Length(vPath)-1, 1) <> '\' then begin
      vPath:=vPath+'\';
   end;

   for vCnt:=1 to pCapacidade do begin
      TImage(FindComponent('img_'+IntToStr(vCnt))).Picture:=nil;
   end;

   Application.ProcessMessages;

   if FindFirst(vPath+'*.*', vAtt, vSR) = 0 then begin
      repeat
         //if (vSR.Attr and vAtt) = vSR.Attr then begin    // * algumas imagens não carregam, por falta de atributos *
            if LowerCase(Copy(vSR.Name, Length(vSR.Name)-3, 4)) = '.jpg' then begin
               vQtdImgs:=vQtdImgs+1;
            end;
         //end;
      until FindNext(vSR) <> 0;

      FindClose(vSR);
   end;

   ShowMessage('Imagens: '+IntToStr(vQtdImgs));

   if vQtdImgs > 0 then begin

      vQtdPgns:=Floor(vQtdImgs / pCapacidade);

      if Frac(vQtdImgs / pCapacidade) > 0 then begin
         vQtdPgns:=vQtdPgns+1;
      end;

      edt_pag_final.Text:=IntToStr(vQtdPgns);

      // 1 * 20 = 20
      // 2 * 20 = 40
      // 3 * 20 = 60       pPag * pCapacidade = pPagFinal

      // 1        =   1
      // 1  + 20  =  21    pPagIni = 1
      // 21 + 20  =  41    if pPagIni <> 1 then Inc(pPagIni, 20)
      // 41 + 20  =  61

      vAux:=1;

      if vPontoInicio > 1 then begin
         for vCnt:=2 to vPontoInicio do begin
            Inc(vAux, 20);
         end;
      end;

      if FindFirst(vPath+'*.*', vAtt, vSR) = 0 then begin
         vImgLoad:=0;
         vCnt:=0;
         repeat
            //if (vSR.Attr and vAtt) = vSR.Attr then begin // * algumas imagens não carregam, por falta de atributos *
               if LowerCase(Copy(vSR.Name, Length(vSR.Name)-3, 4)) = '.jpg' then begin
                  vCnt:=vCnt+1;
                  //ShowMessage(IntToStr(vCnt)+' <= '+IntToStr(pPontoInicio * pCapacidade)+' and '+IntToSTr(vCnt)+' >= '+ IntToStr(vAux));
                  if (vCnt <= (pPontoInicio * pCapacidade)) and (vCnt >= vAux) then begin
                     vImgLoad:=vImgLoad+1;
                     TImage(FindComponent('img_'+IntToStr(vImgLoad))).Picture.LoadFromFile(vPath + vSR.Name);
                     Application.ProcessMessages;
                     if vImgLoad = pCapacidade then break;
                  end;
               end;
            //end;
         until FindNext(vSR) <> 0;

         FindClose(vSR);
      end;
   end;
end;

procedure TfmCadastrarFoto.MostrarThumbs;
begin
   pnl_imagem.Visible:=not pnl_imagem.Visible;
   pnl_tumbs.Top:=8;
   pnl_tumbs.Left:=8;
   pnl_tumbs.Visible:=not pnl_tumbs.Visible;
   pnl_tumbs.BringToFront;
end;

procedure TfmCadastrarFoto.FormShow(Sender: TObject);
begin
   inherited;
   fmMenu.pubTransImg:=nil;
   pnl_imagem.Visible:=False;
end;

//function TfmCadastrarFoto.GerarImagem: TStream;
////var vJPG : TJPG;
//begin
//   img_imagem.Picture.Graphic.SaveToStream(Result);
//end;

procedure TfmCadastrarFoto.btn_confirmarClick(Sender: TObject);
begin
   fmMenu.pubTransImg:=GravarImagemBD(img_imagem);
   Close;
end;

procedure TfmCadastrarFoto.btn_anteriorClick(Sender: TObject);
var vInt : Integer;
begin
   if Trim(edt_pag_ini.Text) <> '' then begin
      vInt:=StrToInt(edt_pag_ini.Text);
      Dec(vInt);
      if vInt > 0 then begin
         edt_pag_ini.Text:=IntToStr(vInt);
         CarregarDiretorio(edt_diretorio_fotos.Text, 20, vInt);
      end;
   end;
end;

procedure TfmCadastrarFoto.btn_proximoClick(Sender: TObject);
var vInt : Integer;
begin
   if Trim(edt_pag_ini.Text) <> '' then begin
      vInt:=StrToInt(edt_pag_ini.Text);
      Inc(vInt);
      if vInt <= StrToInt(edt_pag_final.Text) then begin
         edt_pag_ini.Text:=IntToStr(vInt);
         CarregarDiretorio(edt_diretorio_fotos.Text, 20, vInt);
      end;
   end;
end;

end.
