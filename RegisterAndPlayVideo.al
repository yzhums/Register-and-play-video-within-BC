codeunit 50118 RegisterNewVideos
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::Video, OnRegisterVideo, '', false, false)]
    local procedure OnRegisterVideo(var Sender: Codeunit Video);
    begin
        Sender.Register('801277c3-645a-4471-a40b-d6cfdad7112e', 'What''s new: Business Central developer tools (2023 release wave 2)', 'https://www.youtube.com/embed/TY82NR2hGEg', Enum::"Video Category"::Customize);
        Sender.Register('801277c3-645a-4471-a40b-d6cfdad7112e', 'Get low friction go lives and optimize your investments with telemetry data', 'https://www.youtube.com/embed/F_pssS0FtUc', Enum::"Video Category"::ReadyForBusiness);
        Sender.Register('801277c3-645a-4471-a40b-d6cfdad7112e', 'Introducing: Analyze data on lists and queries', 'https://www.youtube.com/embed/qmLVKyHRhNc', Enum::"Video Category"::ReadyForBusiness);
    end;
}

tableextension 50115 ItemExt extends Item
{
    fields
    {
        field(50000; VideoURL; Text[100])
        {
            Caption = 'Video URL';
            Description = 'Embed video';
            DataClassification = CustomerContent;
        }
    }
}
pageextension 50115 ItemCardExt extends "Item Card"
{
    layout
    {
        addafter("Purchasing Code")
        {
            field(VideoURL; Rec.VideoURL)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Video Url, such as youtube.';
            }
        }
    }
    actions
    {
        addlast(processing)
        {
            action(PlayVideo)
            {
                Caption = 'Play Video';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                image = Picture;

                trigger OnAction()
                var
                    VideoCod: Codeunit Video;
                begin
                    VideoCod.Play(Rec.VideoURL);
                end;
            }
        }
    }
}
