unit Main.View;

interface

uses
{$REGION '  Import: Winapi''s ..'}
  Winapi.Windows,
  Winapi.Messages,
{$ENDREGION}
{$REGION '  Import: System''s ..'}
  System.SysUtils,
  System.Variants,
  System.Classes,
{$ENDREGION}
{$REGION '  Import: Vcl''s ..'}
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls
{$ENDREGION}
;

type
  TMainView = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainView: TMainView;

implementation

uses
  System.StrUtils;

{$R *.dfm}

type
  PString = ^string;

  TStringHelper = record helper for string
    function ToPointer: PString;
  end;

{ TStringHelper }

function TStringHelper.ToPointer: PString;
begin
  Result := @Self;
end;

{ My Real TERNARY OPERATOR }
function If_Then(aCondition: Boolean; const aTrue, aFalse: PString): string;
var
  LResult: string;
begin
  LResult := '';

  if aCondition then begin
    if aTrue <> nil then LResult := aTrue^ else LResult := '';
  end else begin
    if aFalse <> nil then LResult := aFalse^ else LResult := '';
  end;

  Result := LResult;
end;

type
  TMyClass = class
  private
    fValue: string;
  public
    property Value: string Read fValue write fValue;
  end;

function IsAllocated(aObj: TMyClass): Boolean;
begin
  Result := Assigned(aObj);

  if Result then
    aObj.Value := 'the OBJECT Is Allocated ..';
end;

procedure TMainView.FormCreate(Sender: TObject);
var
  LObj: TMyClass;
begin
  LObj := nil;
  LObj := TMyClass.Create;

  Label1.Caption := If_Then(IsAllocated(LObj),
    LObj.Value.ToPointer, 'Not Allocated Yet !!'.ToPointer);

end;

end.
