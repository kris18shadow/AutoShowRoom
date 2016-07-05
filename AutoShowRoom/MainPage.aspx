<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="AutoShowRoom.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <div>
        <asp:Label ID="Label1" runat="server" Text=" AutoShowRoom Project version 1.0 " BorderStyle="Ridge" Font-Size="18pt" ForeColor="#00CC00" BorderColor="Black" Width="440px"></asp:Label>
    </div>
    <div>
        <asp:Button ID="ImportXmlToBdButton" runat="server" Height="60px" Text="Прехвърли XML файлове в БД" Width="370px" PostBackUrl="~/XmltoDb.aspx" />
    </div>
    <div>
        <asp:Button ID="InputFormButton" runat="server" Height="60px" Text="Попълни форма и прехвърли в БД" Width="370px" PostBackUrl="~/InputForm.aspx" />
    </div>
        
    </form>
</body>
</html>
