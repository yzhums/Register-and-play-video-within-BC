pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(RunHyperLink)
            {
                Caption = 'Run HyperLink';
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Hyperlink('https://www.youtube.com/watch?v=qmLVKyHRhNc');
                end;
            }
            action(RunHyperLinkInBC)
            {
                Caption = 'Run HyperLink in BC';
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ZYHyperLink: Page "ZY HyperLink";
                begin
                    ZYHyperLink.SetURL('https://www.youtube.com/embed/TY82NR2hGEg');
                    ZYHyperLink.Run();
                end;
            }
        }
    }
}
page 50111 "ZY HyperLink"
{
    Extensible = false;
    Caption = 'HyperLink';
    Editable = false;
    PageType = Card;
    layout
    {
        area(content)
        {
            group(Control5)
            {
                ShowCaption = false;
            }
            usercontrol(WebPageViewer; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
            {
                ApplicationArea = All;
                trigger ControlAddInReady(callbackUrl: Text)
                begin
                    CurrPage.WebPageViewer.Navigate(URL);
                end;

                trigger Callback(data: Text)
                begin
                    CurrPage.Close();
                end;
            }
        }
    }
    var
        URL: Text;

    procedure SetURL(NavigateToURL: Text)
    begin
        URL := NavigateToURL;
    end;
}
