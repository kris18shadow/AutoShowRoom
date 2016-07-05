<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XmltoDb.aspx.cs" Inherits="AutoShowRoom.XmltoDb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="ReadXmlAndTransferToDb" runat="server" Text="Прочети XML-и и запиши в БД" OnClick="AddXmlToDataBaseButton_Click" Height="31px" Width="353px"/>    
    </div>
        <h2>Съдържание на БД:</h2>
        <p>            
            <asp:GridView ID="AutoshowroomsGridView" runat="server"
            DataKeyNames="Name" ItemType="AutoShowRoom.AutoShowRoom" SelectMethod="AutoshowroomsGridView_GetData"
            AllowPaging="False" AutoGenerateColumns="False" PageSize="30" CellPadding="5" Width="349px">
            <Columns>                
            <asp:BoundField DataField="Name" HeaderText="Showroom Name" />                       
            </Columns>
            </asp:GridView>            
            
        </p>
        <h2>Статус на прехвърляне в БД:</h2>
        <p>
            <asp:Table ID="StatusTable" runat="server" GridLines="Horizontal"></asp:Table>
        </p>
        <p>
            <asp:Button ID="DeleteDb" runat="server" Text="Изтрий записи в БД" OnClick="DeleteDbButton_Click" Height="31px" Width="353px"/>
        </p>
            <asp:HyperLink ID="ToMainHyperLink" runat="server" NavigateUrl="~/MainPage.aspx">Back to main page</asp:HyperLink>
    </form>
</body>
</html>
